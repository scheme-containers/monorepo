(import (scheme base)
        (scheme read)
        (scheme write)
        (lassik dockerfile)
        (scheme-docker-lib))

(cond-expand (gauche (import (gauche base))))

(define (pp x)
  (cond-expand (gauche (pprint x))))

(define (displayln x)
  (display x)
  (newline))

(define (writeln x)
  (write x)
  (newline))

(define (read-all)
  (let loop ((forms '()))
    (let ((form (read)))
      (if (eof-object? form) (reverse forms) (loop (cons form forms))))))

(define (display-dockerfile instructions)
  (for-each displayln (map quote-dockerfile-instruction instructions)))

(define (main os)
  (let* ((implementation (cons 'implementation (read-all)))
         (dockerfile (os-implementation-dockerfile os implementation)))
    #;(pp dockerfile)
    (display-dockerfile dockerfile)))

#;(main 'alpine)
(main 'debian:bullseye)
#;(main 'freebsd)
