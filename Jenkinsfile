pipeline {
    agent {
        label 'agent1'
    }

    triggers {
        cron('0 1 * * 1,3,5')
    }

    options {
        disableConcurrentBuilds()
            buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'SCHEMES', defaultValue: 'biwascheme chezscheme chibi chicken cyclone gauche guile kawa lips loko meevax mit-scheme racket sagittarius scm stak stklos tr7', description: 'Build and deploy theses Schemes')
    }

    environment {
        DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
        DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
    }

    stages {

        stage('Build and deploy') {
            parallel {
                stage('head x86_64') {
                    agent {
                        dockerfile {
                            label 'agent1'
                            filename 'Dockerfile.jenkins'
                            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        script {
                            params.SCHEMES.split().each { SCHEME ->

                                stage("${SCHEME} Debian build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "make SCHEME=${SCHEME} VERSION=head build"
                                        }
                                    }
                                }

                                stage("${SCHEME} Debian push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                            sh "make SCHEME=${SCHEME} VERSION=head push"
                                            sh "docker logout"
                                        }
                                    }
                                }

                                stage("${SCHEME} Alpine build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "make SCHEME=${SCHEME} VERSION=head LINUX=alpine build"
                                        }
                                    }
                                }

                                stage("${SCHEME} Alpine push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                            sh "make SCHEME=${SCHEME} VERSION=head LINUX=alpine push"
                                            sh "docker logout"
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
                stage('head arm') {
                    agent {
                        dockerfile {
                            label 'agent1'
                            filename 'Dockerfile.jenkins'
                            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        script {
                            params.SCHEMES.split().each { SCHEME ->

                                stage("${SCHEME} Debian build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "make SCHEME=${SCHEME} VERSION=head ARCH=aarch64 build"
                                        }
                                    }
                                }

                                stage("${SCHEME} Debian push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                            sh "make SCHEME=${SCHEME} VERSION=head ARCH=aarch64 push | docker logout"
                                            sh "docker logout"
                                        }
                                    }
                                }

                                stage("${SCHEME} Alpine build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "make SCHEME=${SCHEME} VERSION=head LINUX=alpine ARCH=aarch64 build push"
                                        }
                                    }
                                }

                                stage("${SCHEME} Alpine push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                            sh "make SCHEME=${SCHEME} VERSION=head ARCH=aarch64 push | docker logout"
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
}
