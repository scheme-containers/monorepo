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
        string(name: 'DEPLOY_SCHEME', defaultValue: 'none', description: 'Deploy this scheme with tag latest on x86 and arm')
        string(name: 'DEPLOY_VERSION', defaultValue: 'none', description: 'Deploy this version, for example guile/3, 3 would the version and would be deployed as guile:latest and guile:3')
    }

    environment {
        DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
        DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
    }

    stages {

        stage('Deploy latest') {
            parallel {
                stage('x86_64 deploy latest') {
                    agent {
                        label 'agent1'
                    }
                    when {
                        expression {
                            return "${params.DEPLOY_SCHEME}" != "none" && "${params.DEPLOY_VERSION}" != "none"
                        }
                    }
                    steps {
                        sh "docker build ${params.DEPLOY_SCHEME}/${params.DEPLOY_VERSION} --tag=schemers/${params.DEPLOY_SCHEME}:latest"
                        sh "docker build ${params.DEPLOY_SCHEME}/${params.DEPLOY_VERSION} --tag=schemers/${params.DEPLOY_SCHEME}:${params.DEPLOY_VERSION}"
                    }
                }
                stage('arm deploy latest') {
                    agent {
                        label 'agent3'
                    }
                }
            }

        stage('Heads') {
            parallel {
                stage('x86_64 fast') {
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

                stage('arm fast') {
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
                                                sh "docker build . --tag=schemers/${SCHEME}:head-arm"
                                            }
                                        }
                                    }
                                }
                                stage("${SCHEME} push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                                sh "docker push schemers/${SCHEME}:head-arm"
                                                sh "docker logout"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                stage('x86_64 slow') {
                    agent {
                        label 'agent1'
                    }
                    steps {
                        script {
                            def schemes = "bigloo cyclone gambit guile racket".split()
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

                stage('arm slow') {
                    agent {
                        label 'agent3'
                    }
                    steps {
                        script {
                            def schemes = "bigloo cyclone gambit guile racket".split()
                            schemes.each { SCHEME ->
                                stage("${SCHEME} build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker build . --tag=schemers/${SCHEME}:head-arm"
                                            }
                                        }
                                    }
                                }
                                stage("${SCHEME} push") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            dir("implementations/${SCHEME}/head") {
                                                sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                                sh "docker push schemers/${SCHEME}:head-arm"
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
