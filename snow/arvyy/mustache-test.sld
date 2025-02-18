(define-library
  (arvyy mustache-test)

  (import (scheme base)
          (scheme write)
          (arvyy mustache)
          (srfi 41))
  
  (export run-tests)

  (cond-expand
    (chibi
      (import (rename (except (chibi test) test-equal)
                      (test test-equal))))
    ((library (srfi 64))
     (import (srfi 64)))
    (else (error "No testing library found")))
  
  (begin
    (define-syntax test-mustache
      (syntax-rules ()
        ((_ name data template expected)
         (test-equal name expected (execute (compile "foo" (lambda args template)) data)))
        ((_ name data partials template expected)
         (let* ((partials* (cons (cons "root" template) partials))
                (fn (lambda (n) 
                      (cond
                        ((assoc n partials*) => cdr)
                        (else #f)))))
           (test-equal name expected (execute (compile "root" fn) data)))))))
  
  (include "mustache-test/comments.scm"
           "mustache-test/delimiters.scm"
           "mustache-test/implementation-specific.scm"
           "mustache-test/interpolation.scm"
           "mustache-test/inverted.scm"
           "mustache-test/partials.scm"
           "mustache-test/sections.scm")

  (begin
    
    (define (run-tests)
      (test-begin "mustache")

      (test-group 
        "comments"
        (run-tests/comments))

      (test-group
        "delimiters"
        (run-tests/delimiters))

      (test-group
        "interpolation"
        (run-tests/interpolation))

      (test-group
        "inverted"
        (run-tests/inverted))

      (test-group
        "partials"
        (run-tests/partials))

      (test-group
        "sections"
        (run-tests/sections))

      (test-group
        "implementation-specific"
        (run-tests/implementation-specific))

      (test-end))))
