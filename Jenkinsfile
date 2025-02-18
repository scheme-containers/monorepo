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
          sh 'test "$BRANCH" = "master" && docker push schemers/bigloo:4'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/bigloo:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/biwascheme:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:10'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9'
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:9'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-alpine'
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:9-alpine'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-threads'
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:9-threads'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/chibi:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chibi-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/chibi:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/chicken:4'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-5'
          sh 'test "$BRANCH" = "master" && docker push schemers/chicken:5'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/chicken:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/conscheme:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/cyclone:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make cyclone-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/cyclone:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/dfsch:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/digamma:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/elk:3'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/femtolisp:head'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make femtolisp-head-lambdaconservatory'
          sh 'test "$BRANCH" = "master" && docker push schemers/femtolisp:head-lambdaconservatory'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/foment:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make foment-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/foment:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/gambit:4'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gambit-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/gambit:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/gauche:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gauche-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/gauche:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/gerbil:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/guile:2'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-3'
          sh 'test "$BRANCH" = "master" && docker push schemers/guile:3'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/guile:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/husk:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ikarus:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ironscheme:1'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ironscheme-1-mono'
          sh 'test "$BRANCH" = "master" && docker push schemers/ironscheme:1-mono'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/jazz:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/kawa:3'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make kawa-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/kawa:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ksi:3'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/larceny:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/lips:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/loko:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-0-base'
          sh 'test "$BRANCH" = "master" && docker push schemers/loko:0-base'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/loko:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/minischeme:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/mit-scheme:10'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-11'
          sh 'test "$BRANCH" = "master" && docker push schemers/mit-scheme:11'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-12'
          sh 'test "$BRANCH" = "master" && docker push schemers/mit-scheme:12'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/mosh:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mosh-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/mosh:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/oaklisp:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/otus:2'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/owl:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make owl-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/owl:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/pc-scheme:3'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/picrin:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make picrin-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/picrin:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/racket:8'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/rep:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/rhizome-pi:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/rscheme:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/s7:head'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s7-latest'
          sh 'test "$BRANCH" = "master" && docker push schemers/s7:latest'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/s9fes:2018'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sagittarius:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sagittarius-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/sagittarius:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/scheme48:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/schemik:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/schluessel:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/scm:5'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/scsh:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/shoe:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sigscheme:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/siod:3'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sisc:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sizzle:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/skint:0'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make skint-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/skint:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/stalin:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/stklos:1'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-2'
          sh 'test "$BRANCH" = "master" && docker push schemers/stklos:2'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/stklos:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sxm:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/tinyscheme:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/tr7:1'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-2'
          sh 'test "$BRANCH" = "master" && docker push schemers/tr7:2'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/tr7:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/umb:3'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/unlikely:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/unsyntax:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/vicare:0'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/vscm:1'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/vx:head'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/xscheme:head-lambdaconservatory'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ypsilon:head'
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
