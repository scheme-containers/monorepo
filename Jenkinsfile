pipeline {

    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage('bigloo debian 4') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian bigloo 4'
            }
        }
        stage('bigloo alpine 4') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine bigloo 4'
            }
        }
        stage('bigloo debian latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian bigloo latest'
            }
        }
        stage('bigloo alpine latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine bigloo latest'
            }
        }
        stage('bigloo debian head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian bigloo head'
            }
        }
        stage('bigloo alpine head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine bigloo head'
            }
        }
        stage('biwascheme debian 0') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian biwascheme 0'
            }
        }
        stage('biwascheme alpine 0') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine biwascheme 0'
            }
        }
        stage('biwascheme debian latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian biwascheme latest'
            }
        }
        stage('biwascheme alpine latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine biwascheme latest'
            }
        }
        stage('biwascheme debian head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian biwascheme head'
            }
        }
        stage('biwascheme alpine head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine biwascheme head'
            }
        }
        stage('chezscheme debian 10') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian chezscheme 10'
            }
        }
        stage('chezscheme alpine 10') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine chezscheme 10'
            }
        }
        stage('chibi debian 0') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian chibi 0'
            }
        }
        stage('chibi alpine 0') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine chibi 0'
            }
        }
        stage('chibi debian latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian chibi latest'
            }
        }
        stage('chibi alpine latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine chibi latest'
            }
        }
        stage('chibi debian head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian chibi head'
            }
        }
        stage('chibi alpine head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine chibi head'
            }
        }
        stage('sagittarius debian 0') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian sagittarius 0'
            }
        }
        stage('sagittarius alpine 0') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine sagittarius 0'
            }
        }
        stage('sagittarius debian latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian sagittarius latest'
            }
        }
        stage('sagittarius alpine latest') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine sagittarius latest'
            }
        }
        stage('sagittarius debian head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build debian sagittarius head'
            }
        }
        stage('sagittarius alpine head') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh './build alpine sagittarius head'
            }
        }
    }
}
