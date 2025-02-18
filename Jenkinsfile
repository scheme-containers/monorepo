pipeline {
  agent any
  triggers {
    cron('0 0 * * *')
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
  }
  stages {
    stage('Docker login') {
        environment {
            DOCKER_USERNAME = credentials('DOCKER_USERNAME')
            DOCKER_ACCESS_TOKEN = credentials('DOCKER_ACCESS_TOKEN')
        }
        sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_ACCESS_TOKEN}'
    }
    stage('bigloo') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-4'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-head'
        }
      }
    }
    stage('biwascheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make biwascheme-head'
        }
      }
    }
    stage('chezscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-10'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-alpine'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-threads'
        }
      }
    }
    stage('chibi') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chibi-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chibi-head'
        }
      }
    }
    stage('chicken') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-4'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-5'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-head'
        }
      }
    }
    stage('conscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make conscheme-head'
        }
      }
    }
    stage('cyclone') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make cyclone-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make cyclone-head'
        }
      }
    }
    stage('dfsch') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make dfsch-head'
        }
      }
    }
    stage('digamma') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make digamma-head'
        }
      }
    }
    stage('elk') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make elk-3'
        }
      }
    }
    stage('femtolisp') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make femtolisp-head'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make femtolisp-head-lambdaconservatory'
        }
      }
    }
    stage('foment') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make foment-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make foment-head'
        }
      }
    }
    stage('gambit') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gambit-4'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gambit-head'
        }
      }
    }
    stage('gauche') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gauche-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gauche-head'
        }
      }
    }
    stage('gerbil') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gerbil-0'
        }
      }
    }
    stage('guile') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-2'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-3'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-head'
        }
      }
    }
    stage('husk') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make husk-head'
        }
      }
    }
    stage('ikarus') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ikarus-head'
        }
      }
    }
    stage('ironscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ironscheme-1'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ironscheme-1-mono'
        }
      }
    }
    stage('jazz') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make jazz-head'
        }
      }
    }
    stage('kawa') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make kawa-3'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make kawa-head'
        }
      }
    }
    stage('ksi') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ksi-3'
        }
      }
    }
    stage('larceny') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make larceny-1'
        }
      }
    }
    stage('lips') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make lips-head'
        }
      }
    }
    stage('loko') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-0-base'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-head'
        }
      }
    }
    stage('minischeme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make minischeme-0'
        }
      }
    }
    stage('mit-scheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-10'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-11'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-12'
        }
      }
    }
    stage('mosh') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mosh-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mosh-head'
        }
      }
    }
    stage('oaklisp') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make oaklisp-1'
        }
      }
    }
    stage('otus') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make otus-2'
        }
      }
    }
    stage('owl') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make owl-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make owl-head'
        }
      }
    }
    stage('pc-scheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make pc-scheme-3'
        }
      }
    }
    stage('picrin') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make picrin-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make picrin-head'
        }
      }
    }
    stage('racket') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make racket-8'
        }
      }
    }
    stage('rep') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make rep-0'
        }
      }
    }
    stage('rhizome-pi') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make rhizome-pi-0'
        }
      }
    }
    stage('rscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make rscheme-0'
        }
      }
    }
    stage('s7') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s7-head'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s7-latest'
        }
      }
    }
    stage('s9fes') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s9fes-2018'
        }
      }
    }
    stage('sagittarius') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sagittarius-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sagittarius-head'
        }
      }
    }
    stage('scheme48') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make scheme48-1'
        }
      }
    }
    stage('schemik') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make schemik-1'
        }
      }
    }
    stage('schluessel') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make schluessel-0'
        }
      }
    }
    stage('scm') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make scm-5'
        }
      }
    }
    stage('scsh') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make scsh-0'
        }
      }
    }
    stage('shoe') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make shoe-0'
        }
      }
    }
    stage('sigscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sigscheme-0'
        }
      }
    }
    stage('siod') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make siod-3'
        }
      }
    }
    stage('sisc') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sisc-1'
        }
      }
    }
    stage('sizzle') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sizzle-0'
        }
      }
    }
    stage('skint') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make skint-0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make skint-head'
        }
      }
    }
    stage('stalin') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stalin-0'
        }
      }
    }
    stage('stklos') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-1'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-2'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-head'
        }
      }
    }
    stage('sxm') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sxm-1'
        }
      }
    }
    stage('tinyscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tinyscheme-1'
        }
      }
    }
    stage('tr7') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-1'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-2'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-head'
        }
      }
    }
    stage('umb') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make umb-3'
        }
      }
    }
    stage('unlikely') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make unlikely-head'
        }
      }
    }
    stage('unsyntax') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make unsyntax-head'
        }
      }
    }
    stage('vicare') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make vicare-0'
        }
      }
    }
    stage('vscm') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make vscm-1'
        }
      }
    }
    stage('vx') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make vx-head'
        }
      }
    }
    stage('xscheme') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make xscheme-head-lambdaconservatory'
        }
      }
    }
    stage('ypsilon') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ypsilon-head'
        }
      }
    }
    }

  post {
      always {
          sh 'docker logout'
      }
  }
}
