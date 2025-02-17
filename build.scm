(import (scheme base)
        (scheme write)
        (scheme file)
        (srfi 170))


(define implementations (directory-files "implementations"))
(define print
  (lambda items
    (for-each
      (lambda (item)
        (display item)
        (newline))
      items)))

(print
  "pipeline {"
  "  agent any"
  "  triggers {"
  "    cron('0 0 * * *')"
  "  }"
  "  options {"
  "    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))"
  "  }"
  "  stages {")

(for-each
  (lambda (implementation)
    (let ((versions (directory-files (string-append "implementations/"
                                                    implementation))))
      (when (member #t (map (lambda (item)
                                   (or (number? (string->number item))
                                       (string=? item "head")))
                                 versions))
      (print (string-append "      stage('" implementation "') {")
             "        steps {")
      (for-each
        (lambda (version)
          (when (or (string->number version)
                    (string=? version "head"))
            (print "          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {"
              (string-append "            sh 'docker build"
                                  " implementations/" implementation "/" version
                                  " --tag=schemers/" implementation ":" version
                                  "'")
              "          }")))
          versions)
      (print "        }")
      (print "      }"))))
    implementations)

(print "    }"
       "}")
