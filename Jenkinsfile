pipeline {
    agent {
        label 'agent1'
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

        stage('Heads') {
            parallel {
                stage('x86_64') {
                    agent {
                        label 'agent1'
                    }
                    steps {
                        script {
                            def schemes = "biwascheme chezscheme chibi chicken foment gauche ironscheme kawa lips loko meevax mit-scheme mosh sagittarius skint stak stklos tr7 ypsilon".split()
                            schemes.each { SCHEME ->
                                stage("${SCHEME} build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker build . --tag=schemers/${SCHEME}:head"
                                            }
                                        }
                                    }
                                }
                                stage("${SCHEME} push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                                sh "docker push schemers/${SCHEME}:head"
                                                sh "docker logout"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                stage('arm') {
                    agent {
                        label 'agent3'
                    }
                    steps {
                        script {
                            def schemes = "biwascheme chezscheme chibi chicken foment gauche ironscheme kawa lips loko meevax mit-scheme mosh sagittarius skint stak stklos tr7 ypsilon".split()
                            schemes.each { SCHEME ->
                                stage("${SCHEME} build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker build . --tag=schemers/${SCHEME}:head"
                                            }
                                        }
                                    }
                                }
                                stage("${SCHEME} push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                                sh "docker push schemers/${SCHEME}:head"
                                                sh "docker logout"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('bigloo') {
            parallel {
                stage('x86_64') {
                    agent { label 'agent1' }
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
                stage('arm') {
                    agent { label 'agent3' }
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

        stage('cyclone') {
            parallel {
                stage('x86_64') {
                    agent { label 'agent1' }
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
                stage('arm') {
                    agent { label 'agent3' }
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

        stage('gambit') {
            parallel {
                stage('x86_64') {
                    agent { label 'agent1' }
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
                stage('arm') {
                    agent { label 'agent3' }
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

        stage('guile') {
            parallel {
                stage('x86_64') {
                    agent { label 'agent1' }
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
                stage('arm') {
                    agent { label 'agent3' }
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

        stage('racket') {
            parallel {
                stage('x86_64') {
                    agent { label 'agent1' }
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
                stage('arm') {
                    agent { label 'agent3' }
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

        stage('Docker logout x86') {
            agent {
                label 'agent1'
            }
            steps {
                sh "docker logout"
            }
        }

        stage('Docker logout arm') {
            agent {
                label 'agent3'
            }
            steps {
                sh "docker logout"
            }
        }
    }

    post {
        always {
            sh "docker logout"
        }
    }
}
