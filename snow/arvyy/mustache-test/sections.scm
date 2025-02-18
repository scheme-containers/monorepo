(define (run-tests/sections)
    (test-mustache "Truthy"
                   '((boolean . #t))
                   "\"{{#boolean}}This should be rendered.{{/boolean}}\""
                   "\"This should be rendered.\"")

    (test-mustache "Falsey"
                   '((boolean . #f))
                   "\"{{#boolean}}This should not be rendered.{{/boolean}}\""
                   "\"\"")

    ;; "Null is falsey" test is skipped; no meaningful value for null

    (test-mustache "Context"
                   '((context . ((name . "Joe"))))
                   "\"{{#context}}Hi {{name}}.{{/context}}\""
                   "\"Hi Joe.\"")

    (test-mustache "Parent contexts"
                   '((a . "foo")
                     (b . "wrong")
                     (sec . ((b . "bar")))
                     (c . ((d . "baz"))))
                   "\"{{#sec}}{{a}}, {{b}}, {{c.d}}{{/sec}}\""
                   "\"foo, bar, baz\"")

    (test-mustache "Variable test"
                   '((foo . "bar"))
                   "\"{{#foo}}{{.}} is {{foo}}{{/foo}}\""
                   "\"bar is bar\"")

    (test-mustache "List Contexts"
                   '((tops . #(((tname . ((upper . "A")
                                          (lower . "a")))
                                (middles . #(((mname . "1")
                                              (bottoms . #(((bname . "x"))
                                                           ((bname . "y")))))))))))
                   "{{#tops}}{{#middles}}{{tname.lower}}{{mname}}.{{#bottoms}}{{tname.upper}}{{mname}}{{bname}}.{{/bottoms}}{{/middles}}{{/tops}}"
                   "a1.A1x.A1y.")

    (test-mustache "Deeply Nested Contexts"
                   '((a . ((one . 1)))
                     (b . ((two . 2)))
                     (c . ((three . 3)
                           (d . ((four . 4)
                                 (five . 5))))))
                   "
                   {{#a}}
                   {{one}}
                   {{#b}}
                   {{one}}{{two}}{{one}}
                   {{#c}}
                   {{one}}{{two}}{{three}}{{two}}{{one}}
                   {{#d}}
                   {{one}}{{two}}{{three}}{{four}}{{three}}{{two}}{{one}}
                   {{#five}}
                   {{one}}{{two}}{{three}}{{four}}{{five}}{{four}}{{three}}{{two}}{{one}}
                   {{one}}{{two}}{{three}}{{four}}{{.}}6{{.}}{{four}}{{three}}{{two}}{{one}}
                   {{one}}{{two}}{{three}}{{four}}{{five}}{{four}}{{three}}{{two}}{{one}}
                   {{/five}}
                   {{one}}{{two}}{{three}}{{four}}{{three}}{{two}}{{one}}
                   {{/d}}
                   {{one}}{{two}}{{three}}{{two}}{{one}}
                   {{/c}}
                   {{one}}{{two}}{{one}}
                   {{/b}}
                   {{one}}
                   {{/a}}
                   "
                   "
                   1
                   121
                   12321
                   1234321
                   123454321
                   12345654321
                   123454321
                   1234321
                   12321
                   121
                   1
                   "
                   ))

