pipeline {
  agent any
  options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }
  stages {
      stage('bigloo') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/bigloo/4 --tag=schemers/bigloo:4'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/bigloo/head --tag=schemers/bigloo:head'
          }
        }
      }
      stage('biwascheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/biwascheme/head --tag=schemers/biwascheme:head'
          }
        }
      }
      stage('chezscheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chezscheme/10 --tag=schemers/chezscheme:10'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chezscheme/9 --tag=schemers/chezscheme:9'
          }
        }
      }
      stage('chibi') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chibi/0 --tag=schemers/chibi:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chibi/head --tag=schemers/chibi:head'
          }
        }
      }
      stage('chicken') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chicken/4 --tag=schemers/chicken:4'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chicken/5 --tag=schemers/chicken:5'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/chicken/head --tag=schemers/chicken:head'
          }
        }
      }
      stage('conscheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/conscheme/head --tag=schemers/conscheme:head'
          }
        }
      }
      stage('cyclone') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/cyclone/0 --tag=schemers/cyclone:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/cyclone/head --tag=schemers/cyclone:head'
          }
        }
      }
      stage('dfsch') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/dfsch/head --tag=schemers/dfsch:head'
          }
        }
      }
      stage('digamma') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/digamma/head --tag=schemers/digamma:head'
          }
        }
      }
      stage('elk') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/elk/3 --tag=schemers/elk:3'
          }
        }
      }
      stage('femtolisp') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/femtolisp/head --tag=schemers/femtolisp:head'
          }
        }
      }
      stage('foment') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/foment/0 --tag=schemers/foment:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/foment/head --tag=schemers/foment:head'
          }
        }
      }
      stage('gambit') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/gambit/4 --tag=schemers/gambit:4'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/gambit/head --tag=schemers/gambit:head'
          }
        }
      }
      stage('gauche') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/gauche/0 --tag=schemers/gauche:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/gauche/head --tag=schemers/gauche:head'
          }
        }
      }
      stage('gerbil') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/gerbil/0 --tag=schemers/gerbil:0'
          }
        }
      }
      stage('guile') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/guile/2.2 --tag=schemers/guile:2.2'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/guile/3.0 --tag=schemers/guile:3.0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/guile/head --tag=schemers/guile:head'
          }
        }
      }
      stage('husk') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/husk/head --tag=schemers/husk:head'
          }
        }
      }
      stage('ikarus') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/ikarus/head --tag=schemers/ikarus:head'
          }
        }
      }
      stage('ironscheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/ironscheme/1.0 --tag=schemers/ironscheme:1.0'
          }
        }
      }
      stage('jazz') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/jazz/head --tag=schemers/jazz:head'
          }
        }
      }
      stage('kawa') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/kawa/3 --tag=schemers/kawa:3'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/kawa/head --tag=schemers/kawa:head'
          }
        }
      }
      stage('ksi') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/ksi/3 --tag=schemers/ksi:3'
          }
        }
      }
      stage('larceny') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/larceny/1.3 --tag=schemers/larceny:1.3'
          }
        }
      }
      stage('lips') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/lips/head --tag=schemers/lips:head'
          }
        }
      }
      stage('loko') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/loko/0 --tag=schemers/loko:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/loko/head --tag=schemers/loko:head'
          }
        }
      }
      stage('minischeme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/minischeme/0 --tag=schemers/minischeme:0'
          }
        }
      }
      stage('mit-scheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/mit-scheme/10 --tag=schemers/mit-scheme:10'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/mit-scheme/11 --tag=schemers/mit-scheme:11'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/mit-scheme/12 --tag=schemers/mit-scheme:12'
          }
        }
      }
      stage('mosh') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/mosh/0 --tag=schemers/mosh:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/mosh/head --tag=schemers/mosh:head'
          }
        }
      }
      stage('oaklisp') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/oaklisp/1 --tag=schemers/oaklisp:1'
          }
        }
      }
      stage('otus') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/otus/2 --tag=schemers/otus:2'
          }
        }
      }
      stage('owl') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/owl/0 --tag=schemers/owl:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/owl/head --tag=schemers/owl:head'
          }
        }
      }
      stage('pc-scheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/pc-scheme/3.03 --tag=schemers/pc-scheme:3.03'
          }
        }
      }
      stage('picrin') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/picrin/0 --tag=schemers/picrin:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/picrin/head --tag=schemers/picrin:head'
          }
        }
      }
      stage('racket') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/racket/8 --tag=schemers/racket:8'
          }
        }
      }
      stage('rep') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/rep/0 --tag=schemers/rep:0'
          }
        }
      }
      stage('rhizome-pi') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/rhizome-pi/0 --tag=schemers/rhizome-pi:0'
          }
        }
      }
      stage('rscheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/rscheme/0 --tag=schemers/rscheme:0'
          }
        }
      }
      stage('s7') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/s7/head --tag=schemers/s7:head'
          }
        }
      }
      stage('s9fes') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/s9fes/2018 --tag=schemers/s9fes:2018'
          }
        }
      }
      stage('sagittarius') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/sagittarius/0 --tag=schemers/sagittarius:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/sagittarius/head --tag=schemers/sagittarius:head'
          }
        }
      }
      stage('scheme48') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/scheme48/1.9 --tag=schemers/scheme48:1.9'
          }
        }
      }
      stage('schemik') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/schemik/1 --tag=schemers/schemik:1'
          }
        }
      }
      stage('schluessel') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/schluessel/0 --tag=schemers/schluessel:0'
          }
        }
      }
      stage('scm') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/scm/5 --tag=schemers/scm:5'
          }
        }
      }
      stage('scsh') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/scsh/0 --tag=schemers/scsh:0'
          }
        }
      }
      stage('shoe') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/shoe/0 --tag=schemers/shoe:0'
          }
        }
      }
      stage('sigscheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/sigscheme/0 --tag=schemers/sigscheme:0'
          }
        }
      }
      stage('siod') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/siod/3 --tag=schemers/siod:3'
          }
        }
      }
      stage('sisc') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/sisc/1.16 --tag=schemers/sisc:1.16'
          }
        }
      }
      stage('sizzle') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/sizzle/0 --tag=schemers/sizzle:0'
          }
        }
      }
      stage('skint') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/skint/0 --tag=schemers/skint:0'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/skint/head --tag=schemers/skint:head'
          }
        }
      }
      stage('stalin') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/stalin/0 --tag=schemers/stalin:0'
          }
        }
      }
      stage('stklos') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/stklos/1 --tag=schemers/stklos:1'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/stklos/2 --tag=schemers/stklos:2'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/stklos/head --tag=schemers/stklos:head'
          }
        }
      }
      stage('sxm') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/sxm/1.1 --tag=schemers/sxm:1.1'
          }
        }
      }
      stage('tinyscheme') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/tinyscheme/1 --tag=schemers/tinyscheme:1'
          }
        }
      }
      stage('tr7') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/tr7/1 --tag=schemers/tr7:1'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/tr7/2 --tag=schemers/tr7:2'
          }
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/tr7/head --tag=schemers/tr7:head'
          }
        }
      }
      stage('umb') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/umb/3 --tag=schemers/umb:3'
          }
        }
      }
      stage('unlikely') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/unlikely/head --tag=schemers/unlikely:head'
          }
        }
      }
      stage('unsyntax') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/unsyntax/head --tag=schemers/unsyntax:head'
          }
        }
      }
      stage('vicare') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/vicare/0 --tag=schemers/vicare:0'
          }
        }
      }
      stage('vscm') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/vscm/1 --tag=schemers/vscm:1'
          }
        }
      }
      stage('vx') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/vx/head --tag=schemers/vx:head'
          }
        }
      }
      stage('ypsilon') {
        steps {
          catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'docker build implementations/ypsilon/head --tag=schemers/ypsilon:head'
          }
        }
      }
    }
}
