(import (scheme base)
        (docker-action))

(define-implementation
  (name "bigloo")
  (versions (version
             (name "4")
             (tags "4" "0-bullseye" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye"))))

(define-implementation
  (name "biwascheme")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "chezscheme")
  (versions (version
             (name "9.5")
             (tags "9.5" "9" "9-bullseye-slim" "latest"))
            (version
             (name "9.5-alpine")
             (tags "9.5-alpine" "9-alpine" "alpine"))
            (version
             (name "9.5-threads")
             (tags "9.5-threads" "9-threads" "threads"))))

(define-implementation
  (name "chibi")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "chicken")
  (versions (version
             (name "5.3")
             (tags "5" "5.3" "5-bullseye-slim" "latest"))))

(define-implementation
  (name "conscheme")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "cyclone")
  (versions (version
             (name "0")
             (tags "0" "head-sid-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-sid-slim"))))

(define-implementation
  (name "dfsch")
  (versions (version
             (name "head")
             (tags "head" "head-buster-slim" "latest"))))

(define-implementation
  (name "digamma")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "elk")
  (versions (version
             (name "3")
             (tags "3" "3-bullseye-slim" "latest"))))

(define-implementation
  (name "femtolisp")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim"))
            (version
             (name "head-lambdaconservatory")
             (tags "head-lambdaconservatory"
                   "head-lambdaconservatory-bullseye-slim"))))

(define-implementation
  (name "foment")
  (versions (version
             (name "0")
             (tags "0" "0-buster-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-buster-slim"))))

(define-implementation
  (name "gambit")
  (versions (version
             (name "4")
             (tags "4" "4.9" "4-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "gauche")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "gerbil")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "guile")
  (versions (version
             (name "2")
             (tags "2" "2.2"))
            (version
             (name "3")
             (tags "3" "3.0" "3-bullseye-slim" "latest"))))

(define-implementation
  (name "husk")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "ikarus")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "ironscheme")
  (versions (version
             (name "1.0")
             (tags "1.0" "1" "1-bullseye-slim" "latest"))
            (version
             (name "1.0-mono")
             (tags "1.0-mono" "mono"))))

(define-implementation
  (name "jazz")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "kawa")
  (versions (version
             (name "3.1")
             (tags "3.1" "3" "3-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "ksi")
  (versions (version
             (name "3")
             (tags "3" "3-bullseye-slim" "latest"))))

(define-implementation
  (name "larceny")
  (versions (version
             (name "1.3")
             (tags "1.3" "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "loko")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "minischeme")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "mit-scheme")
  (versions (version
             (name "10")
             (tags "10" "10-bullseye-slim"))
            (version
             (name "11")
             (tags "11" "11-bullseye-slim" "latest"))))

(define-implementation
  (name "mosh")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "oaklisp")
  (versions (version
             (name "1")
             (tags "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "otus")
  (versions (version
             (name "2")
             (tags "2" "2-bullseye-slim" "latest"))))

(define-implementation
  (name "owl")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "pc-scheme")
  (versions (version
             (name "3.03")
             (tags "3.03" "3" "3-bullseye-slim" "latest"))))

(define-implementation
  (name "picrin")
  (versions (version
             (name "0")
             (tags "0" "0-buster-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-buster-slim"))))

(define-implementation
  (name "racket")
  (versions (version
             (name "6")
             (tags "6" "6-bullseye-slim" "latest"))))

(define-implementation
  (name "rep")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "rhizome-pi")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "rscheme")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "sagittarius")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "s7")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "s9fes")
  (versions (version
             (name "2018")
             (tags "2018" "2018-bullseye-slim" "latest"))))

(define-implementation
  (name "scheme48")
  (versions (version
             (name "1.9")
             (tags "1.9" "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "schemik")
  (versions (version
             (name "1")
             (tags "1" "1-buster-slim" "latest"))))

(define-implementation
  (name "schluessel")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "siod")
  (versions (version
             (name "3")
             (tags "3" "3-bullseye-slim" "latest"))))

(define-implementation
  (name "sisc")
  (versions (version
             (name "1.16")
             (tags "1.6" "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "sizzle")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "stklos")
  (versions (version
             (name "1")
             (tags "1" "1-bullseye-slim" "latest"))
            (version
             (name "head")
             (tags "head" "head-bullseye-slim"))))

(define-implementation
  (name "sxm")
  (versions (version
             (name "1.1")
             (tags "1.1" "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "tinyscheme")
  (versions (version
             (name "1")
             (tags "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "umb")
  (versions (version
             (name "3")
             (tags "3" "3-bullseye-slim" "latest"))))

(define-implementation
  (name "unlikely")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "unsyntax")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "vicare")
  (versions (version
             (name "0")
             (tags "0" "0-bullseye-slim" "latest"))))

(define-implementation
  (name "vscm")
  (versions (version
             (name "1")
             (tags "1" "1-bullseye-slim" "latest"))))

(define-implementation
  (name "vx")
  (versions (version
             (name "head")
             (tags "head" "head-bullseye-slim" "latest"))))

(define-implementation
  (name "xscheme")
  (versions (version
             (name "head-lambdaconservatory")
             (tags "head-lambdaconservatory"
                   "head-lambdaconservatory-bullseye-slim"
                   "latest"))))

(define-implementation
  (name "ypsilon")
  (versions (version
             (name "head-lambdaconservatory")
             (tags "head-lambdaconservatory"
                   "head-lambdaconservatory-bullseye-slim"
                   "latest"))))

