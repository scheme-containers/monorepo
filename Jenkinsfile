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
        string(name: 'SCHEMES', defaultValue: 'chibi tr7', description: 'Build and deploy theses Schemes')
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
                            label 'agent1'
                            filename 'Dockerfile.jenkins'
                            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        script {
                            params.SCHEMES.each { SCHEME ->
                                stage("${SCHEME} build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                                sh "make SCHEME=${SCHEME} VERSION=head build"
                                                sh "docker logout"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                stage('arm deploy Debian head') {
                    agent {
                        dockerfile {
                            label 'agent1'
                            filename 'Dockerfile.jenkins'
                            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        script {
                            params.SCHEMES.each { SCHEME ->
                                stage("${SCHEME} build") {
                                    timeout(time: 6, unit: 'HOURS') {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}"
                                                sh "make SCHEME=${SCHEME} VERSION=head build"
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
