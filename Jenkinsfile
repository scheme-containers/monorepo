pipeline {
    agent {
        label 'docker-x86_64'
    }

    triggers {
        cron('@weekly')
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'SCHEMES', defaultValue: 'biwascheme capyscheme chibi cyclone gauche guile lips meevax scheme-rs skint stak stklos tr7', description: 'Build and deploy theses Schemes')
        string(name: 'LINUXES', defaultValue: 'debian alpine', description: 'Build and deploy images on these linuxes')
        string(name: 'VERSIONS', defaultValue: 'head', description: 'Build and deploy these versions')
    }

    environment {
        DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
        DOCKER_HUB_TOKEN = credentials('DOCKER_HUB_TOKEN')
    }

    stages {

        stage('Build and deploy') {
            parallel {
                stage('x86_64') {
                    agent {
                        dockerfile {
                            label 'docker-x86_64'
                            filename 'Dockerfile.jenkins'
                            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        script {
                            params.SCHEMES.split().each { SCHEME ->
                                params.LINUXES.split().each { LINUX ->
                                    params.VERSIONS.split().each { VERSION ->
                                        stage("${SCHEME} ${LINUX} ${VERSION} x86_64 build") {
                                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                sh "sleep 30"
                                                sh "make SCHEME=${SCHEME} VERSION=${VERSION} LINUX=${LINUX} ARCH=x86_64 DOCKER_ARGS=--no-cache build"
                                            }
                                        }

                                        stage("${SCHEME} ${LINUX} ${VERSION} x86_64 push") {
                                            timeout(time: 6, unit: 'HOURS') {
                                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                    sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                                                    sh "make SCHEME=${SCHEME} VERSION=${VERSION} LINUX=${LINUX} ARCH=x86_64 push"
                                                    sh "docker logout"
                                                    sh "make SCHEME=${SCHEME} VERSION=${VERSION} LINUX=${LINUX} ARCH=x86_64 clean-image"
                                                }
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
                        dockerfile {
                            label 'docker-arm'
                            filename 'Dockerfile.jenkins'
                            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        script {
                            params.SCHEMES.split().each { SCHEME ->
                                params.LINUXES.split().each { LINUX ->
                                    params.VERSIONS.split().each { VERSION ->
                                        stage("${SCHEME} ${LINUX} ${VERSION} arm build") {
                                            timeout(time: 6, unit: 'HOURS') {
                                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                    sh "sleep 30"
                                                    sh "make SCHEME=${SCHEME} VERSION=${VERSION} LINUX=${LINUX} ARCH=aarch64 DOCKER_ARGS=--no-cache build"
                                                }
                                            }
                                        }

                                        stage("${SCHEME} ${LINUX} ${VERSION} arm push") {
                                            timeout(time: 6, unit: 'HOURS') {
                                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                    sh 'docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}'
                                                    sh "make SCHEME=${SCHEME} VERSION=${VERSION} LINUX=${LINUX} ARCH=aarch64 push"
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
    }
}
