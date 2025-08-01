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

    environment {
        DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
        DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
    }

    stages {
        stage('Docker login') {
            steps {
                sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
            }
        }

        stage('Heads') {
            steps {
                script {
                    def implementations = "biwascheme chezscheme chibi chicken foment gauche ironscheme kawa lips loko meevax mit-scheme mosh sagittarius skint stak stklos tr7 ypsilon".split()
                    parallel implementations.collectEntries { implementation->
                        [(implementation): {
                                stage("${implementation} build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${implementation}/head") {
                                                sh "docker build . --tag=schemers/${implementation}:head"
                                            }
                                        }
                                    }
                                }
                                stage("${implementation} push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${implementation}/head") {
                                                sh "docker push schemers/${implementation}:head"
                                            }
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }

        stage('Docker logout') {
            steps {
                sh "docker logout"
            }
        }

        stage('cyclone') {
            steps {
                timeout(time: 6, unit: 'HOURS') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        dir("implementations/${STAGE_NAME}/head") {
                            sh "docker build . --tag=schemers/${STAGE_NAME}:head"
                        }
                        sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                        sh "docker push schemers/${STAGE_NAME}:head"
                        sh "docker logout"
                    }
                }
            }
        }

        stage('gambit') {
            steps {
                timeout(time: 6, unit: 'HOURS') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        dir("implementations/${STAGE_NAME}/head") {
                            sh "docker build . --tag=schemers/${STAGE_NAME}:head"
                        }
                        sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                        sh "docker push schemers/${STAGE_NAME}:head"
                        sh "docker logout"
                    }
                }
            }
        }

        stage('guile') {
            steps {
                timeout(time: 6, unit: 'HOURS') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        dir("implementations/${STAGE_NAME}/head") {
                            sh "docker build . --tag=schemers/${STAGE_NAME}:head"
                        }
                        sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                        sh "docker push schemers/${STAGE_NAME}:head"
                        sh "docker logout"
                    }
                }
            }
        }

        stage('racket') {
            steps {
                timeout(time: 6, unit: 'HOURS') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        dir("implementations/${STAGE_NAME}/head") {
                            sh "docker build . --tag=schemers/${STAGE_NAME}:head"
                        }
                        sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                        sh "docker push schemers/${STAGE_NAME}:head"
                        sh "docker logout"
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
