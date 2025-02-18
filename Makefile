build:
	gosh -r7 -I ./snow build.scm

bigloo-4:
	docker build implementations/bigloo/4 --tag=bigloo:4

bigloo-head:
	docker build implementations/bigloo/head --tag=bigloo:head

biwascheme-head:
	docker build implementations/biwascheme/head --tag=biwascheme:head

chezscheme-10:
	docker build implementations/chezscheme/10 --tag=chezscheme:10

chezscheme-9:
	docker build implementations/chezscheme/9 --tag=chezscheme:9

chezscheme-9-alpine:
	docker build implementations/chezscheme/9-alpine --tag=chezscheme:9-alpine

chezscheme-9-threads:
	docker build implementations/chezscheme/9-threads --tag=chezscheme:9-threads

chibi-0:
	docker build implementations/chibi/0 --tag=chibi:0

chibi-head:
	docker build implementations/chibi/head --tag=chibi:head

chicken-4:
	docker build implementations/chicken/4 --tag=chicken:4

chicken-5:
	docker build implementations/chicken/5 --tag=chicken:5

chicken-head:
	docker build implementations/chicken/head --tag=chicken:head

conscheme-head:
	docker build implementations/conscheme/head --tag=conscheme:head

cyclone-0:
	docker build implementations/cyclone/0 --tag=cyclone:0

cyclone-head:
	docker build implementations/cyclone/head --tag=cyclone:head

dfsch-head:
	docker build implementations/dfsch/head --tag=dfsch:head

digamma-head:
	docker build implementations/digamma/head --tag=digamma:head

elk-3:
	docker build implementations/elk/3 --tag=elk:3

femtolisp-head:
	docker build implementations/femtolisp/head --tag=femtolisp:head

femtolisp-head-lambdaconservatory:
	docker build implementations/femtolisp/head-lambdaconservatory --tag=femtolisp:head-lambdaconservatory

foment-0:
	docker build implementations/foment/0 --tag=foment:0

foment-head:
	docker build implementations/foment/head --tag=foment:head

gambit-4:
	docker build implementations/gambit/4 --tag=gambit:4

gambit-head:
	docker build implementations/gambit/head --tag=gambit:head

gauche-0:
	docker build implementations/gauche/0 --tag=gauche:0

gauche-head:
	docker build implementations/gauche/head --tag=gauche:head

gerbil-0:
	docker build implementations/gerbil/0 --tag=gerbil:0

guile-2:
	docker build implementations/guile/2 --tag=guile:2

guile-3:
	docker build implementations/guile/3 --tag=guile:3

guile-head:
	docker build implementations/guile/head --tag=guile:head

husk-head:
	docker build implementations/husk/head --tag=husk:head

ikarus-head:
	docker build implementations/ikarus/head --tag=ikarus:head

ironscheme-1:
	docker build implementations/ironscheme/1 --tag=ironscheme:1

ironscheme-1-mono:
	docker build implementations/ironscheme/1-mono --tag=ironscheme:1-mono

jazz-head:
	docker build implementations/jazz/head --tag=jazz:head

kawa-3:
	docker build implementations/kawa/3 --tag=kawa:3

kawa-head:
	docker build implementations/kawa/head --tag=kawa:head

ksi-3:
	docker build implementations/ksi/3 --tag=ksi:3

larceny-1:
	docker build implementations/larceny/1 --tag=larceny:1

lips-head:
	docker build implementations/lips/head --tag=lips:head

loko-0:
	docker build implementations/loko/0 --tag=loko:0

loko-0-base:
	docker build implementations/loko/0-base --tag=loko:0-base

loko-head:
	docker build implementations/loko/head --tag=loko:head

minischeme-0:
	docker build implementations/minischeme/0 --tag=minischeme:0

mit-scheme-10:
	docker build implementations/mit-scheme/10 --tag=mit-scheme:10

mit-scheme-11:
	docker build implementations/mit-scheme/11 --tag=mit-scheme:11

mit-scheme-12:
	docker build implementations/mit-scheme/12 --tag=mit-scheme:12

mosh-0:
	docker build implementations/mosh/0 --tag=mosh:0

mosh-head:
	docker build implementations/mosh/head --tag=mosh:head

oaklisp-1:
	docker build implementations/oaklisp/1 --tag=oaklisp:1

otus-2:
	docker build implementations/otus/2 --tag=otus:2

owl-0:
	docker build implementations/owl/0 --tag=owl:0

owl-head:
	docker build implementations/owl/head --tag=owl:head

pc-scheme-3:
	docker build implementations/pc-scheme/3 --tag=pc-scheme:3

picrin-0:
	docker build implementations/picrin/0 --tag=picrin:0

picrin-head:
	docker build implementations/picrin/head --tag=picrin:head

racket-8:
	docker build implementations/racket/8 --tag=racket:8

rep-0:
	docker build implementations/rep/0 --tag=rep:0

rhizome-pi-0:
	docker build implementations/rhizome-pi/0 --tag=rhizome-pi:0

rscheme-0:
	docker build implementations/rscheme/0 --tag=rscheme:0

s7-head:
	docker build implementations/s7/head --tag=s7:head

s7-latest:
	docker build implementations/s7/latest --tag=s7:latest

s9fes-2018:
	docker build implementations/s9fes/2018 --tag=s9fes:2018

sagittarius-0:
	docker build implementations/sagittarius/0 --tag=sagittarius:0

sagittarius-head:
	docker build implementations/sagittarius/head --tag=sagittarius:head

scheme48-1:
	docker build implementations/scheme48/1 --tag=scheme48:1

schemik-1:
	docker build implementations/schemik/1 --tag=schemik:1

schluessel-0:
	docker build implementations/schluessel/0 --tag=schluessel:0

scm-5:
	docker build implementations/scm/5 --tag=scm:5

scsh-0:
	docker build implementations/scsh/0 --tag=scsh:0

shoe-0:
	docker build implementations/shoe/0 --tag=shoe:0

sigscheme-0:
	docker build implementations/sigscheme/0 --tag=sigscheme:0

siod-3:
	docker build implementations/siod/3 --tag=siod:3

sisc-1:
	docker build implementations/sisc/1 --tag=sisc:1

sizzle-0:
	docker build implementations/sizzle/0 --tag=sizzle:0

skint-0:
	docker build implementations/skint/0 --tag=skint:0

skint-head:
	docker build implementations/skint/head --tag=skint:head

stalin-0:
	docker build implementations/stalin/0 --tag=stalin:0

stklos-1:
	docker build implementations/stklos/1 --tag=stklos:1

stklos-2:
	docker build implementations/stklos/2 --tag=stklos:2

stklos-head:
	docker build implementations/stklos/head --tag=stklos:head

sxm-1:
	docker build implementations/sxm/1 --tag=sxm:1

tinyscheme-1:
	docker build implementations/tinyscheme/1 --tag=tinyscheme:1

tr7-1:
	docker build implementations/tr7/1 --tag=tr7:1

tr7-2:
	docker build implementations/tr7/2 --tag=tr7:2

tr7-head:
	docker build implementations/tr7/head --tag=tr7:head

umb-3:
	docker build implementations/umb/3 --tag=umb:3

unlikely-head:
	docker build implementations/unlikely/head --tag=unlikely:head

unsyntax-head:
	docker build implementations/unsyntax/head --tag=unsyntax:head

vicare-0:
	docker build implementations/vicare/0 --tag=vicare:0

vscm-1:
	docker build implementations/vscm/1 --tag=vscm:1

vx-head:
	docker build implementations/vx/head --tag=vx:head

xscheme-head-lambdaconservatory:
	docker build implementations/xscheme/head-lambdaconservatory --tag=xscheme:head-lambdaconservatory

ypsilon-head:
	docker build implementations/ypsilon/head --tag=ypsilon:head

