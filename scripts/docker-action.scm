(define-library (docker-action)

(export define-implementation
        generate-all-push-workflows
        generate-push-workflow)

(import (scheme base)
        (scheme file)
        (scheme write)
        (srfi 1)
        (srfi 28)
        (srfi 69)
        (srfi 132))

(begin
  (define (alist-ref key alist)
    (let ((res (assoc key alist)))
      (if res
          (cdr res)
          #f)))
  
  (define (implementation-name impl)
    (alist-ref 'name impl))

  (define (implementation-versions impl)
    (alist-ref 'versions impl))

  (define (version-name vers)
    (alist-ref 'name vers))

  (define (version-tags vers)
    (alist-ref 'tags vers))

  (define implementations (make-hash-table))

  (define-syntax define-version-aux
    (syntax-rules (name tags)
      ((_ (lst ...))
       `(lst ...))
      ((_ (lst ...) (name n) prop ...)
       (define-version-aux ((name . n) lst ...) prop ...))
      ((_ (lst ...) (tags t ...) prop ...)
       (define-version-aux ((tags . ,(list t ...)) lst ...) prop ...))))

  (define-syntax define-version
    (syntax-rules (name tags)
      ((_ prop ...)
       (define-version-aux () prop ...))))

  (define-syntax define-implementation-aux
    (syntax-rules (name versions version)
      ((_ n (vs ...))
       (hash-table-set! implementations
                        n
                        `((name . n)
                          (versions . ,(list vs ...)))))
      ((_ ? vs (name n) attr ...)
       (define-implementation-aux
         n vs attr ...))
      ((_ n (vs ...) (versions (version prop ...) rst ...) attr ...)
       (define-implementation-aux
         n (vs ... (define-version prop ...)) (versions rst ...) attr ...))
      ((_ n (vs ...) (versions) attr ...)
       (define-implementation-aux
         n (vs ...) attr ...))))

  (define-syntax define-implementation
    (syntax-rules ()
      ((_ attr ...)
       (define-implementation-aux #f () attr ...))))

  (define (generate-build-step image-name version)
    (define image-with-tag
      (format "~a:~a" image-name (version-name version)))
    (format "      -
        name: Build and push schemers/~a
        uses: docker/build-push-action@v2
        with:
          push: true
          context: implementations/~a/~a/
          tags: |~%~a"
            image-with-tag
            image-name (version-name version)
            (apply string-append
                   (map (lambda (tag)
                          (string-append "            schemers/"
                                         image-name
                                         ":"
                                         tag
                                         "\n"))
                        (version-tags version)))))

  (define (generate-build-steps impl)
    (define name (implementation-name impl))
    (define versions (implementation-versions impl))
    (apply string-append
           (map (lambda (v)
                  (generate-build-step name v))
                versions)))

  (define (generate-push-workflow impl-name)
    (string-append
     (format
      "
name: docker-~a-push-action

on:
  push:
    branches:
      - 'master'
    paths:
      - implementations/~a/**/Dockerfile

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      -
        name: Checkout
        uses: actions/checkout@v2
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1
      -
        name: Login to DockerHub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
"
      impl-name
      impl-name)
     (generate-build-steps (hash-table-ref implementations impl-name))))

  (define (generate-all-push-workflows target-dir)
    (for-each (lambda (impl-name)
                (with-output-to-file
                    (string-append target-dir "/" impl-name "-push-action.yml")
                  (lambda ()
                    (display (generate-push-workflow impl-name)))))
              (hash-table-keys implementations)))
))
