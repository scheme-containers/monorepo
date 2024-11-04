
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

(define string-join
  (lambda (list-of-strings between-string)
    (let ((combined (apply string-append
                           (map (lambda (string-item)
                                  (string-append string-item between-string))
                                list-of-strings))))
      (string-copy combined (- (string-length combined) (string-length between-string))))))

