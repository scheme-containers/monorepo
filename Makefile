build:
	gosh -r7 -I ./snow build.scm

bigloo-4:
	docker build implementations/bigloo/4 --tag=schemers/bigloo:4

bigloo-head:
	docker build implementations/bigloo/head --tag=schemers/bigloo:head

biwascheme-head:
	docker build implementations/biwascheme/head --tag=schemers/biwascheme:head

chezscheme-10:
	docker build implementations/chezscheme/10 --tag=schemers/chezscheme:10

chezscheme-9:
	docker build implementations/chezscheme/9 --tag=schemers/chezscheme:9

chezscheme-9-alpine:
	docker build implementations/chezscheme/9-alpine --tag=schemers/chezscheme:9-alpine

chezscheme-9-threads:
	docker build implementations/chezscheme/9-threads --tag=schemers/chezscheme:9-threads

chibi-0:
	docker build implementations/chibi/0 --tag=schemers/chibi:0

chibi-head:
	docker build implementations/chibi/head --tag=schemers/chibi:head

chicken-4:
	docker build implementations/chicken/4 --tag=schemers/chicken:4

chicken-5:
	docker build implementations/chicken/5 --tag=schemers/chicken:5

chicken-head:
	docker build implementations/chicken/head --tag=schemers/chicken:head

conscheme-head:
	docker build implementations/conscheme/head --tag=schemers/conscheme:head

cyclone-0:
	docker build implementations/cyclone/0 --tag=schemers/cyclone:0

cyclone-head:
	docker build implementations/cyclone/head --tag=schemers/cyclone:head

dfsch-head:
	docker build implementations/dfsch/head --tag=schemers/dfsch:head

digamma-head:
	docker build implementations/digamma/head --tag=schemers/digamma:head

elk-3:
	docker build implementations/elk/3 --tag=schemers/elk:3

femtolisp-head:
	docker build implementations/femtolisp/head --tag=schemers/femtolisp:head

femtolisp-head-lambdaconservatory:
	docker build implementations/femtolisp/head-lambdaconservatory --tag=schemers/femtolisp:head-lambdaconservatory

foment-0:
	docker build implementations/foment/0 --tag=schemers/foment:0

foment-head:
	docker build implementations/foment/head --tag=schemers/foment:head

gambit-4:
	docker build implementations/gambit/4 --tag=schemers/gambit:4

gambit-head:
	docker build implementations/gambit/head --tag=schemers/gambit:head

gauche-0:
	docker build implementations/gauche/0 --tag=schemers/gauche:0

gauche-head:
	docker build implementations/gauche/head --tag=schemers/gauche:head

gerbil-0:
	docker build implementations/gerbil/0 --tag=schemers/gerbil:0

guile-2:
	docker build implementations/guile/2 --tag=schemers/guile:2

guile-3:
	docker build implementations/guile/3 --tag=schemers/guile:3

guile-head:
	docker build implementations/guile/head --tag=schemers/guile:head

husk-head:
	docker build implementations/husk/head --tag=schemers/husk:head

ikarus-head:
	docker build implementations/ikarus/head --tag=schemers/ikarus:head

ironscheme-1:
	docker build implementations/ironscheme/1 --tag=schemers/ironscheme:1

ironscheme-1-mono:
	docker build implementations/ironscheme/1-mono --tag=schemers/ironscheme:1-mono

jazz-head:
	docker build implementations/jazz/head --tag=schemers/jazz:head

kawa-3:
	docker build implementations/kawa/3 --tag=schemers/kawa:3

kawa-head:
	docker build implementations/kawa/head --tag=schemers/kawa:head

ksi-3:
	docker build implementations/ksi/3 --tag=schemers/ksi:3

larceny-1:
	docker build implementations/larceny/1 --tag=schemers/larceny:1

lips-head:
	docker build implementations/lips/head --tag=schemers/lips:head

loko-0:
	docker build implementations/loko/0 --tag=schemers/loko:0

loko-0-base:
	docker build implementations/loko/0-base --tag=schemers/loko:0-base

loko-head:
	docker build implementations/loko/head --tag=schemers/loko:head

minischeme-0:
	docker build implementations/minischeme/0 --tag=schemers/minischeme:0

mit-scheme-10:
	docker build implementations/mit-scheme/10 --tag=schemers/mit-scheme:10

mit-scheme-11:
	docker build implementations/mit-scheme/11 --tag=schemers/mit-scheme:11

mit-scheme-12:
	docker build implementations/mit-scheme/12 --tag=schemers/mit-scheme:12

mosh-0:
	docker build implementations/mosh/0 --tag=schemers/mosh:0

mosh-head:
	docker build implementations/mosh/head --tag=schemers/mosh:head

oaklisp-1:
	docker build implementations/oaklisp/1 --tag=schemers/oaklisp:1

otus-2:
	docker build implementations/otus/2 --tag=schemers/otus:2

owl-0:
	docker build implementations/owl/0 --tag=schemers/owl:0

owl-head:
	docker build implementations/owl/head --tag=schemers/owl:head

pc-scheme-3:
	docker build implementations/pc-scheme/3 --tag=schemers/pc-scheme:3

picrin-0:
	docker build implementations/picrin/0 --tag=schemers/picrin:0

picrin-head:
	docker build implementations/picrin/head --tag=schemers/picrin:head

racket-8:
	docker build implementations/racket/8 --tag=schemers/racket:8

rep-0:
	docker build implementations/rep/0 --tag=schemers/rep:0

rhizome-pi-0:
	docker build implementations/rhizome-pi/0 --tag=schemers/rhizome-pi:0

rscheme-0:
	docker build implementations/rscheme/0 --tag=schemers/rscheme:0

s7-head:
	docker build implementations/s7/head --tag=schemers/s7:head

s7-latest:
	docker build implementations/s7/latest --tag=schemers/s7:latest

s9fes-2018:
	docker build implementations/s9fes/2018 --tag=schemers/s9fes:2018

sagittarius-0:
	docker build implementations/sagittarius/0 --tag=schemers/sagittarius:0

sagittarius-head:
	docker build implementations/sagittarius/head --tag=schemers/sagittarius:head

scheme48-1:
	docker build implementations/scheme48/1 --tag=schemers/scheme48:1

schemik-1:
	docker build implementations/schemik/1 --tag=schemers/schemik:1

schluessel-0:
	docker build implementations/schluessel/0 --tag=schemers/schluessel:0

scm-5:
	docker build implementations/scm/5 --tag=schemers/scm:5

scsh-0:
	docker build implementations/scsh/0 --tag=schemers/scsh:0

shoe-0:
	docker build implementations/shoe/0 --tag=schemers/shoe:0

sigscheme-0:
	docker build implementations/sigscheme/0 --tag=schemers/sigscheme:0

siod-3:
	docker build implementations/siod/3 --tag=schemers/siod:3

sisc-1:
	docker build implementations/sisc/1 --tag=schemers/sisc:1

sizzle-0:
	docker build implementations/sizzle/0 --tag=schemers/sizzle:0

skint-0:
	docker build implementations/skint/0 --tag=schemers/skint:0

skint-head:
	docker build implementations/skint/head --tag=schemers/skint:head

stalin-0:
	docker build implementations/stalin/0 --tag=schemers/stalin:0

stklos-1:
	docker build implementations/stklos/1 --tag=schemers/stklos:1

stklos-2:
	docker build implementations/stklos/2 --tag=schemers/stklos:2

stklos-head:
	docker build implementations/stklos/head --tag=schemers/stklos:head

sxm-1:
	docker build implementations/sxm/1 --tag=schemers/sxm:1

tinyscheme-1:
	docker build implementations/tinyscheme/1 --tag=schemers/tinyscheme:1

tr7-1:
	docker build implementations/tr7/1 --tag=schemers/tr7:1

tr7-2:
	docker build implementations/tr7/2 --tag=schemers/tr7:2

tr7-head:
	docker build implementations/tr7/head --tag=schemers/tr7:head

umb-3:
	docker build implementations/umb/3 --tag=schemers/umb:3

unlikely-head:
	docker build implementations/unlikely/head --tag=schemers/unlikely:head

unsyntax-head:
	docker build implementations/unsyntax/head --tag=schemers/unsyntax:head

vicare-0:
	docker build implementations/vicare/0 --tag=schemers/vicare:0

vscm-1:
	docker build implementations/vscm/1 --tag=schemers/vscm:1

vx-head:
	docker build implementations/vx/head --tag=schemers/vx:head

xscheme-head-lambdaconservatory:
	docker build implementations/xscheme/head-lambdaconservatory --tag=schemers/xscheme:head-lambdaconservatory

ypsilon-head:
	docker build implementations/ypsilon/head --tag=schemers/ypsilon:head

