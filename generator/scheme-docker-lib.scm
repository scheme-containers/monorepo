;; Copyright 2021 Lassi Kortela
;; SPDX-License-Identifier: MIT

(define build-root "/build")

(define (symbol-or-string? obj)
  (or (symbol? obj) (string? obj)))

(define (sort-and-remove-dups strings)
  (list-delete-neighbor-dups string=? (list-sort string<? strings)))

(define (basename->stem basename)
  (let ((pivot (string-index basename #\.)))
    (unless pivot (error "No dot in basename"))
    (substring basename 0 pivot)))

(define (expand-vars string vars)
  (call-with-port
   (open-output-string)
   (lambda (out)
     (let loop ((a #f) (b 0))
       (cond ((= b (string-length string))
              (if a (error "Missing close brace") (get-output-string out)))
             ((char=? #\} (string-ref string b))
              (if (not a) (error "Stray close brace")
                  (let* ((name (substring string a b))
                         (pair (assoc name vars)))
                    (cond ((not name)
                           (error "No expansion for variable" name))
                          (else (write-string (cdr pair) out)
                                (loop #f (+ b 1)))))))
             ((char=? #\{ (string-ref string b))
              (loop (+ b 1) (+ b 1)))
             (a (loop a (+ b 1)))
             (else (write-char (string-ref string b) out)
                   (loop #f (+ b 1))))))))

(define base-images
  '((alpine . "alpine")
    (debian:bullseye . "debian:bullseye-slim")))

(define dep->os-packages-alist
  '(("autotools"
     ("autoconf" alpine debian:bullseye)
     ("automake" alpine debian:bullseye)
     ("libtool" alpine debian:bullseye)
     ("m4" alpine debian:bullseye))
    ("bdw-gc"
     ("libgc-dev" debian:bullseye)
     ("libgc1" debian:bullseye))
    ("concurrency-kit"
     ("libck-dev" debian:bullseye)
     ("libck0" debian:bullseye))
    ("tommath"
     ("libtommath-dev" debian:bullseye)
     ("libtommath1" debian:bullseye))
    ("libffi"
     ("libffi-dev" debian:bullseye)
     ("libffi7" debian:bullseye))
    ("cpio"
     ("cpio" alpine debian:bullseye))
    ("curl"
     ("curl" alpine debian:bullseye freebsd)
     ("ca-certificates" alpine debian:bullseye))
    ("editline"
     ("libedit-dev" debian:bullseye)
     ("libedit2" debian:bullseye))
    ("file"
     ("file" debian:bullseye))
    ("readline"
     ("libreadline-dev" debian:bullseye)
     ("libreadline7" debian:bullseye))
    ("gcc"
     ("build-base" alpine)
     ("build-essential" debian:bullseye))  ;; gcc libc6-dev
    ("git"
     ("git" alpine debian:bullseye freebsd)
     ("ca-certificates" debian:bullseye))
    ("any-make"
     ("make" alpine debian:bullseye))
    ("gnu-make"
     ("gmake" freebsd)
     ("make" alpine debian:bullseye))
    ("gmp"
     ("gmp" alpine freebsd)
     ("libgmp-dev" debian:bullseye)
     ("libgmp10" debian:bullseye))
    ("golang"
     ("go" alpine freebsd)
     ("golang" debian:bullseye))
    ("pcre"
     ("libpcre3-dev" debian:bullseye)
     ("pcre" alpine freebsd))
    ("pkg-config"
     ("pkg-config" debian:bullseye)
     ("pkgconf" alpine freebsd))
    ("ssl"
     ("libressl" alpine freebsd)
     ("libssl-dev" debian:bullseye)
     ("libssl1.1" debian:bullseye))
    ("texinfo"
     ("install-info" debian:bullseye)
     ("texinfo" alpine debian:bullseye freebsd))
    ("unistring"
     ("libunistring" alpine freebsd)
     ("libunistring-dev" debian:bullseye)
     ("libunistring2" debian:bullseye))
    ("unzip"
     ("unzip" alpine debian:bullseye freebsd))
    ("xz"
     ("xz" alpine)
     ("xz-utils" debian:bullseye))))

(define (dep->os-packages dep os)
  (let ((packages
         (map car (filter (lambda (submapping)
                            (member os (cdr submapping)))
                          (cdr (or (assoc dep dep->os-packages-alist)
                                   (error (string-append
                                           "Unknown dependency: " dep))))))))
    (if (not (null? packages))
        packages
        (error
         (string-append "No " dep " package for " (symbol->string os))))))

(define (alpine-install pkgs)
  `(and (cmd "apk" "update")
        (cmd "apk" "add" "--no-cache" ,@pkgs)))

(define (debian-install pkgs)
  `(and (cmd "apt-get" "update" "-qq")
        (cmd "apt-get" "install" "-qq" "--no-install-recommends" ,@pkgs)
        (cmd "rm" "-rf" (arg "/var/lib/apt/lists/" (verbatim "*")))))

(define (freebsd-install pkgs)
  `(and (cmd "pkg" "update" "-y")
        (cmd "pkg" "add" "-y" ,@pkgs)))

(define (deps->os-install deps os)
  (let* ((install (case os
                    ((alpine)
                     alpine-install)
                    ((debian:bullseye)
                     debian-install)
                    ((freebsd)
                     freebsd-install)
                    (else (error "Unknown OS"))))
         (os-pkgs (sort-and-remove-dups
                   (append-map (lambda (dep) (dep->os-packages dep os))
                               deps))))
    (if (null? os-pkgs) '() `((run (shell ,(install os-pkgs)))))))

(define archive-formats
  '((".tar.bz2" . tar+bzip2)
    (".tar.gz"  . tar+gzip)
    (".tar.xz"  . tar+xz)
    (".tar"     . tar)
    (".tbz"     . tar+bzip2)
    (".tgz"     . tar+gzip)
    (".zip"     . zip)))

(define (archive-format-by-filename filename)
  (let loop ((formats archive-formats))
    (cond ((null? formats) #f)
          ((string-suffix? (caar formats) filename) (cdar formats))
          (else (loop (cdr formats))))))

(define (fetch-url url basename)
  (cond ((or (string-prefix? "http:" url)
             (string-prefix? "https:" url))
         (values '() `((add (src ,url) (dst ,basename)))))
        ((string-prefix? "ftp:" url)
         (values '("curl")
                 `((run (shell (cmd "curl" "--fail" "--silent" "--show-error"
                                    "-o" ,basename "--" ,url))))))
        (else (error "Unknown URL scheme"))))

(define (fetch-source scheme-id version source)
  (define (expand string)
    (expand-vars string (list (cons "scheme-id" scheme-id)
                              (cons "version" version))))
  (unpack-case source
    ((archive (url string?)
              (sha-256 string?)
              (format string? ?)
              (source-directory string? ?)
              (target-directory string? ?)
              (basename string?))
     (set! source-directory
       (or source-directory (string-append scheme-id "-" version)))
     (set! target-directory (or target-directory scheme-id))
     (set! url (expand url))
     (set! source-directory (expand source-directory))
     (set! target-directory (expand target-directory))
     (set! format (or format (archive-format-by-filename url)
                      (error "Cannot determine archive format" url)))
     (let-values (((fetch-deps fetch-instructions)
                   (fetch-url url basename)))
       (let-values (((extract-deps extract-cmd)
                     (case format
                       ((zip)       (values '("unzip") '("unzip" "-q")))
                       ((tar)       (values '() '("tar" "-xf")))
                       ((tar+gzip)  (values '() '("tar" "-xzf")))
                       ((tar+bzip2) (values '() '("tar" "-xjf")))
                       ((tar+xz)    (values '("xz") '("tar" "-xJf")))
                       (else        (error "Unknown archive format"
                                           format)))))
         (let ((deps (append fetch-deps extract-deps))
               (instructions
                `((workdir (path ,build-root))
                  ,@fetch-instructions
                  (run
                   (shell
                    (and (pipe (cmd "echo"
                                    ,(string-append sha-256 "  " basename))
                               (cmd "sha256sum" "-c" "-"))
                         (cmd "mkdir" "tmp")
                         (subshell
                          (and (cmd "cd" "tmp")
                               (cmd ,@extract-cmd
                                    ,(string-append "../" basename))))
                         (cmd "mv" ,(string-append "tmp/" source-directory)
                              ,target-directory)
                         (cmd "rm" "-rf" "tmp/"))))
                  (workdir (path ,(string-append build-root "/"
                                                 target-directory))))))
           (values deps instructions)))))
    ((git (url string?)
          (sha-1 string?)
          (target-directory string? ?))
     (set! target-directory (or target-directory scheme-id))
     (values
      '("git")
      `((workdir (path ,(string-append build-root "/" target-directory)))
        (run (shell (and (cmd "git" "init")
                         (cmd "git" "remote" "add" "--" "origin" ,url)
                         (cmd "git" "fetch" "--tags" "--depth" "1"
                              "--" "origin" ,sha-1)
                         (cmd "git" "reset" "--hard" "FETCH_HEAD")))))))
    (else (error "foo"))))

(define (fetch-sources scheme-id version sources)
  (let loop ((sources sources) (deps '()) (instructions '()))
    (if (null? sources) (values deps instructions)
        (let-values (((deps1 instructions1)
                      (fetch-source scheme-id version (car sources))))
          (loop (cdr sources)
                (append deps deps1)
                (append instructions instructions1))))))

(define (os-release-dockerfile os scheme-id title release)
  (unpack-case release
    ((release (version string?)
              (date string? ?)
              (deps string? *)
              (build-deps string? *)
              (build-steps list? +)
              (run-deps string? *)
              (run-steps list? *)
              (sources list? +)
              (scheme-banner string?))
     (let ((image (cdr (or (assoc os base-images)
                           (error "No Docker base image for OS" os)))))
       (let-values (((fetch-deps fetch-instructions)
                     (fetch-sources scheme-id version sources)))
         `((comment (text "Automatically generated"))
           (blank-line)
           (from (image ,image) (as "build"))
           ,@(deps->os-install (append fetch-deps build-deps) os)
           ,@fetch-instructions
           ,@build-steps
           (blank-line)
           (from (image ,image))
           ,@(deps->os-install (or run-deps '()) os)
           (copy (from "build") (src "/usr/local/") (dst "/usr/local/"))
           (run (exec "ln" "-s" ,scheme-banner
                      "/usr/local/bin/scheme-banner"))
           (cmd (exec "scheme-banner"))))))
    (else #f)))

(define (os-implementation-dockerfile os implementation)
  (unpack-case implementation
    ((implementation (id string? ?)
                     (short-title string? ?)
                     (title string? ?)
                     (long-title string? ?)
                     (tagline string? ?)
                     (based-on string? ?)
                     (repology string? ?)
                     (wikipedia-url string? ?)
                     (homepage-url string? ?)
                     (issue-tracker symbol-or-string? ?)
                     (github string? ?)
                     (sourceforge string? ?)
                     (version-control (lambda (x) #t) *)
                     (features symbol? *)
                     (person string? *)
                     (organization string? *)
                     (academy string? *)
                     (documentation list? *)
                     (packages list? *)
                     (mailing-list list? *)
                     (releases list? *))
     (os-release-dockerfile os id title (last releases)))
    (else #f)))
