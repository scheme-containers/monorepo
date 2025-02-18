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
        steps {
            sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_ACCESS_TOKEN}'
        }
    }
    stage('bigloo') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-4'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/bigloo:4; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/bigloo:head; fi'
        }
      }
    }
    stage('biwascheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make biwascheme-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/biwascheme:head; fi'
        }
      }
    }
    stage('chezscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-10'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chezscheme:10; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chezscheme:9; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-alpine'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chezscheme:9-alpine; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-threads'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chezscheme:9-threads; fi'
        }
      }
    }
    stage('chibi') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chibi-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chibi:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chibi-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chibi:head; fi'
        }
      }
    }
    stage('chicken') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-4'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chicken:4; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-5'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chicken:5; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/chicken:head; fi'
        }
      }
    }
    stage('conscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make conscheme-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/conscheme:head; fi'
        }
      }
    }
    stage('cyclone') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make cyclone-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/cyclone:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make cyclone-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/cyclone:head; fi'
        }
      }
    }
    stage('dfsch') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make dfsch-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/dfsch:head; fi'
        }
      }
    }
    stage('digamma') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make digamma-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/digamma:head; fi'
        }
      }
    }
    stage('elk') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make elk-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/elk:3; fi'
        }
      }
    }
    stage('femtolisp') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make femtolisp-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/femtolisp:head; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make femtolisp-head-lambdaconservatory'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/femtolisp:head-lambdaconservatory; fi'
        }
      }
    }
    stage('foment') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make foment-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/foment:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make foment-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/foment:head; fi'
        }
      }
    }
    stage('gambit') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gambit-4'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/gambit:4; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gambit-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/gambit:head; fi'
        }
      }
    }
    stage('gauche') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gauche-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/gauche:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gauche-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/gauche:head; fi'
        }
      }
    }
    stage('gerbil') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gerbil-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/gerbil:0; fi'
        }
      }
    }
    stage('guile') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-2'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/guile:2; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/guile:3; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/guile:head; fi'
        }
      }
    }
    stage('husk') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make husk-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/husk:head; fi'
        }
      }
    }
    stage('ikarus') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ikarus-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/ikarus:head; fi'
        }
      }
    }
    stage('ironscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ironscheme-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/ironscheme:1; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ironscheme-1-mono'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/ironscheme:1-mono; fi'
        }
      }
    }
    stage('jazz') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make jazz-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/jazz:head; fi'
        }
      }
    }
    stage('kawa') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make kawa-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/kawa:3; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make kawa-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/kawa:head; fi'
        }
      }
    }
    stage('ksi') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ksi-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/ksi:3; fi'
        }
      }
    }
    stage('larceny') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make larceny-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/larceny:1; fi'
        }
      }
    }
    stage('lips') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make lips-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/lips:head; fi'
        }
      }
    }
    stage('loko') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/loko:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-0-base'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/loko:0-base; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/loko:head; fi'
        }
      }
    }
    stage('minischeme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make minischeme-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/minischeme:0; fi'
        }
      }
    }
    stage('mit-scheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-10'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/mit-scheme:10; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-11'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/mit-scheme:11; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-12'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/mit-scheme:12; fi'
        }
      }
    }
    stage('mosh') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mosh-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/mosh:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mosh-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/mosh:head; fi'
        }
      }
    }
    stage('oaklisp') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make oaklisp-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/oaklisp:1; fi'
        }
      }
    }
    stage('otus') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make otus-2'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/otus:2; fi'
        }
      }
    }
    stage('owl') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make owl-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/owl:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make owl-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/owl:head; fi'
        }
      }
    }
    stage('pc-scheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make pc-scheme-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/pc-scheme:3; fi'
        }
      }
    }
    stage('picrin') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make picrin-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/picrin:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make picrin-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/picrin:head; fi'
        }
      }
    }
    stage('racket') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make racket-8'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/racket:8; fi'
        }
      }
    }
    stage('rep') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make rep-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/rep:0; fi'
        }
      }
    }
    stage('rhizome-pi') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make rhizome-pi-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/rhizome-pi:0; fi'
        }
      }
    }
    stage('rscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make rscheme-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/rscheme:0; fi'
        }
      }
    }
    stage('s7') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s7-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/s7:head; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s7-latest'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/s7:latest; fi'
        }
      }
    }
    stage('s9fes') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s9fes-2018'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/s9fes:2018; fi'
        }
      }
    }
    stage('sagittarius') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sagittarius-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/sagittarius:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sagittarius-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/sagittarius:head; fi'
        }
      }
    }
    stage('scheme48') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make scheme48-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/scheme48:1; fi'
        }
      }
    }
    stage('schemik') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make schemik-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/schemik:1; fi'
        }
      }
    }
    stage('schluessel') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make schluessel-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/schluessel:0; fi'
        }
      }
    }
    stage('scm') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make scm-5'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/scm:5; fi'
        }
      }
    }
    stage('scsh') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make scsh-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/scsh:0; fi'
        }
      }
    }
    stage('shoe') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make shoe-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/shoe:0; fi'
        }
      }
    }
    stage('sigscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sigscheme-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/sigscheme:0; fi'
        }
      }
    }
    stage('siod') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make siod-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/siod:3; fi'
        }
      }
    }
    stage('sisc') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sisc-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/sisc:1; fi'
        }
      }
    }
    stage('sizzle') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sizzle-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/sizzle:0; fi'
        }
      }
    }
    stage('skint') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make skint-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/skint:0; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make skint-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/skint:head; fi'
        }
      }
    }
    stage('stalin') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stalin-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/stalin:0; fi'
        }
      }
    }
    stage('stklos') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/stklos:1; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-2'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/stklos:2; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/stklos:head; fi'
        }
      }
    }
    stage('sxm') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sxm-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/sxm:1; fi'
        }
      }
    }
    stage('tinyscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tinyscheme-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/tinyscheme:1; fi'
        }
      }
    }
    stage('tr7') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/tr7:1; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-2'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/tr7:2; fi'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/tr7:head; fi'
        }
      }
    }
    stage('umb') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make umb-3'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/umb:3; fi'
        }
      }
    }
    stage('unlikely') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make unlikely-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/unlikely:head; fi'
        }
      }
    }
    stage('unsyntax') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make unsyntax-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/unsyntax:head; fi'
        }
      }
    }
    stage('vicare') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make vicare-0'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/vicare:0; fi'
        }
      }
    }
    stage('vscm') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make vscm-1'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/vscm:1; fi'
        }
      }
    }
    stage('vx') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make vx-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/vx:head; fi'
        }
      }
    }
    stage('xscheme') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make xscheme-head-lambdaconservatory'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/xscheme:head-lambdaconservatory; fi'
        }
      }
    }
    stage('ypsilon') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ypsilon-head'
          sh 'if [ "$BRANCH" = "master" ]; then docker push schemers/ypsilon:head; fi'
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
