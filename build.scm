(import (scheme base)
        (scheme read)
        (scheme write)
        (scheme file)
        (arvyy mustache))

(include "util.scm")

(define implementations (with-input-from-file "implementations.scm" (lambda () (read))))
(define makefile-job (compile (slurp "templates/Makefile-job")))


(call-with-output-file
  "Makefile.generated"
  (lambda (makefile-out)
    (for-each
      (lambda (implementation)
        (let ((name (cdr (assoc 'name implementation)))
              (banner (cdr (assoc 'banner implementation))))
        (execute makefile-job
                 `((name . ,name)
                   (banner . ,banner)
                   (packages . ,name)) makefile-out)
        (newline makefile-out)
        (newline makefile-out)
        ))
      implementations)))
