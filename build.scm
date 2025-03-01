(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (arvyy mustache)
        (srfi 170))

(define slurp-loop
  (lambda (line result)
    (if (eof-object? line)
      result
      (slurp-loop (read-line) (string-append result line (string #\newline))))))

(define slurp
  (lambda (path)
    (with-input-from-file
      path
      (lambda ()
        (slurp-loop (read-line) "")))))

(define implementations
  (list->vector
    (map
      (lambda (implementation)
        (let ((versions (map (lambda (name)
                               (list (cons 'version name)))
                             (directory-files (string-append "implementations/"
                                                             implementation)))))
          (list (cons 'implementation implementation)
                (cons 'versions (list->vector versions)))))
      (directory-files "implementations"))))

;; Jenkinsfile
(call-with-output-file
  "Jenkinsfile"
  (lambda (out)
    (execute (compile (slurp "templates/Jenkinsfile.template"))
             (list (cons 'implementations implementations))
             out)))

;; Makefile
(call-with-output-file
  "Makefile"
  (lambda (out)
    (execute (compile (slurp "templates/Makefile.template"))
             (list (cons 'implementations implementations))
             out)))
