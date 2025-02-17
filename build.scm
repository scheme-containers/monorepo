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
  "  options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }"
  "  stages {")

(for-each
  (lambda (implementation)
    (let ((versions (directory-files (string-append "implementations/"
                                                    implementation))))
      (print (string-append "    stage('" implementation "') {")
             "      steps {")
      (when (= (length versions) 0)
            (print "        sh 'sleep 0'"))
      (for-each
        (lambda (version)
          (when (or (string->number version)
                    (string=? version "head"))
            (print (string-append "        sh 'docker build"
                                  " implementations/" implementation "/" version
                                  " --tag=schemers/" implementation ":" version
                                  "'"))))
          versions)
      (print "      }")
      ))
    implementations)

(print "    }"
       "}")
