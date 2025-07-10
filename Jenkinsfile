pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage('Heads') {
            steps {
                script {
                    //def implementations = "biwascheme chezscheme chibi foment gambit gauche gerbil guile kawa lips loko meevax mit-scheme mosh racket skint stak stklos tr8 ypsilon".split()
                    def implementations = "chibi".split()

                    implementations.each { implementation->
                        stage("${implementation}") {
                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                dir("implementations/${implementation}/head") {
                                    sh "docker build . --tag=schemers/${implementation}:head"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
