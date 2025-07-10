pipeline {
    agent {
        label 'linux-x86-64'
    }

    triggers {
        cron('0 0 * * *')
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage('Heads') {
            environment {
                DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
                DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
            }
            steps {
                script {
                    def implementations = "biwascheme chezscheme chibi foment gauche guile kawa lips loko meevax mit-scheme mosh racket skint stak stklos tr7 ypsilon".split()

                    implementations.each { implementation->
                        stage("${implementation}") {
                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                dir("implementations/${implementation}/head") {
                                    sh "docker build . --tag=schemers/${implementation}:head"
                                    sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                                    sh "docker push schemers/${implementation}:head"
                                    sh "docker logout"
                                }
                            }
                        }
                    }
                }
            }
        }
        stage('Heads slow') {
            environment {
                DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
                DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
            }
            steps {
                script {
                    def implementations = "gambit gerbil".split()

                    implementations.each { implementation->
                        stage("${implementation}") {
                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                dir("implementations/${implementation}/head") {
                                    sh "docker build . --tag=schemers/${implementation}:head"
                                    sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                                    sh "docker push schemers/${implementation}:head"
                                    sh "docker logout"
                                }
                            }
                        }
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
