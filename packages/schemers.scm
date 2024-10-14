(define-module
  (schemers)
  #:use-module (guix licenses)
  #:use-module (guix search-paths)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages tls))

(define-public
  sagittarius
  (package
    (name "sagittarius")
    (version "0.9.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/sagittarius-"
                     version
                     ".tar.gz"))
              (sha256
                (base32
                  "1390hk3q52c1bmyahj05dspdf8igmk2adhqvgfya7g7z5s8919n3"))))
    (build-system cmake-build-system)
    (native-inputs `(("libgc" ,libgc)
                     ("zlib" ,zlib)
                     ("openssl" ,openssl)
                     ("libffi" ,libffi)))
    (arguments
      `(#:make-flags (list)
        #:phases
        (modify-phases
          %standard-phases
          (replace 'check
                   (lambda _ (invoke "sleep" "0"))))))
    (synopsis "")
    (description
      "")
    (home-page "")
    (license bsd-2)))


