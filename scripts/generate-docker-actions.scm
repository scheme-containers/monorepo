(import (scheme base))

(include "docker-action.scm")
(include "implementations.scm")

(define (main args)
  (define target-dir
    (if (null? args)
        "."
        (car args)))
  (generate-all-push-workflows target-dir))
