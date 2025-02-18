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
            BRANCH = "env.BRANCH_NAME"
        }
        steps {
            sh 'test "$BRANCH" = "master" && docker login -u ${DOCKER_USERNAME} -p ${DOCKER_ACCESS_TOKEN} || true'
        }
    }
    stage('bigloo') {
      environment {
          BRANCH = "env.BRANCH_NAME"
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-4'
          sh 'test "$BRANCH" = "master" && docker push schemers/bigloo:4 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make bigloo-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/bigloo:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/biwascheme:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:10 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9'
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:9 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-alpine'
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:9-alpine || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chezscheme-9-threads'
          sh 'test "$BRANCH" = "master" && docker push schemers/chezscheme:9-threads || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/chibi:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chibi-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/chibi:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/chicken:4 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-5'
          sh 'test "$BRANCH" = "master" && docker push schemers/chicken:5 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make chicken-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/chicken:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/conscheme:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/cyclone:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make cyclone-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/cyclone:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/dfsch:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/digamma:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/elk:3 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/femtolisp:head || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make femtolisp-head-lambdaconservatory'
          sh 'test "$BRANCH" = "master" && docker push schemers/femtolisp:head-lambdaconservatory || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/foment:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make foment-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/foment:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/gambit:4 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gambit-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/gambit:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/gauche:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make gauche-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/gauche:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/gerbil:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/guile:2 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-3'
          sh 'test "$BRANCH" = "master" && docker push schemers/guile:3 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make guile-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/guile:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/husk:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ikarus:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ironscheme:1 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make ironscheme-1-mono'
          sh 'test "$BRANCH" = "master" && docker push schemers/ironscheme:1-mono || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/jazz:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/kawa:3 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make kawa-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/kawa:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ksi:3 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/larceny:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/lips:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/loko:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-0-base'
          sh 'test "$BRANCH" = "master" && docker push schemers/loko:0-base || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make loko-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/loko:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/minischeme:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/mit-scheme:10 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-11'
          sh 'test "$BRANCH" = "master" && docker push schemers/mit-scheme:11 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mit-scheme-12'
          sh 'test "$BRANCH" = "master" && docker push schemers/mit-scheme:12 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/mosh:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make mosh-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/mosh:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/oaklisp:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/otus:2 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/owl:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make owl-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/owl:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/pc-scheme:3 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/picrin:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make picrin-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/picrin:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/racket:8 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/rep:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/rhizome-pi:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/rscheme:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/s7:head || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make s7-latest'
          sh 'test "$BRANCH" = "master" && docker push schemers/s7:latest || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/s9fes:2018 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sagittarius:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make sagittarius-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/sagittarius:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/scheme48:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/schemik:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/schluessel:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/scm:5 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/scsh:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/shoe:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sigscheme:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/siod:3 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sisc:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sizzle:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/skint:0 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make skint-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/skint:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/stalin:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/stklos:1 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-2'
          sh 'test "$BRANCH" = "master" && docker push schemers/stklos:2 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make stklos-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/stklos:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/sxm:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/tinyscheme:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/tr7:1 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-2'
          sh 'test "$BRANCH" = "master" && docker push schemers/tr7:2 || true'
        }
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'make tr7-head'
          sh 'test "$BRANCH" = "master" && docker push schemers/tr7:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/umb:3 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/unlikely:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/unsyntax:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/vicare:0 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/vscm:1 || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/vx:head || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/xscheme:head-lambdaconservatory || true'
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
          sh 'test "$BRANCH" = "master" && docker push schemers/ypsilon:head || true'
        }
      }
    }
    }

  post {
      always {
          sh 'test "$BRANCH" = "master" && docker logout || true'
      }
  }
}
