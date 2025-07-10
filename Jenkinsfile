pipeline {
    agent {
        label 'linux-x86_64'
    }

    triggers {
        cron('0 1 * * *')
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage('Docker login') {
            environment {
                DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
                DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
            }
            steps {
                sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
            }
        }

        stage('Heads') {
            steps {
                script {
                    def implementations = "biwascheme chezscheme chibi foment gauche kawa lips loko meevax mit-scheme mosh skint stak stklos tr7 ypsilon".split()
                    parallel implementations.collectEntries { implementation->
                        [(implementation): {
                                stage("${implementation}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        dir("implementations/${implementation}/head") {
                                            sh "docker build . --tag=schemers/${implementation}:head"
                                            sh "docker push schemers/${implementation}:head"
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }
        stage('Heads slow') {
            steps {
                script {
                    def implementations = "gambit guile gerbil racket".split()
                    parallel implementations.collectEntries { implementation->
                        [(implementation): {
                                stage("${implementation}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        dir("implementations/${implementation}/head") {
                                            sh "docker build . --tag=schemers/${implementation}:head"
                                            sh "docker push schemers/${implementation}:head"
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }
    }

    post {
        always {
            sh "docker logout"
        }
    }
}
