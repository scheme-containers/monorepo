# Scheme containers

**(Project-wide issues and a central wiki are kept in this repo.)**

This is a project by Scheme actives to support the community with
up-to-date containers of ready-to-run Scheme implementations. We
currently make only Docker containers, since that's we know and use
ourselves. Other container platforms can be added if there is demand.

Each container `foo` is run as follows.

To enter the REPL (read-eval-print loop):

    docker run -it schemers/gambit

To enter a Linux bash shell (useful with compile-to-C implementations):

    docker run -it schemers/chicken bash

To use an older version of the implementation:

    docker run -it schemers/guile:2.2

Or an alternative flavor:

    docker run -it schemers/loko:base

Or both at once:

    docker run -it schemers/ironscheme:1-mono


## Building image

Give arguments and run without command to see what will be run.  See the
Makefile for all arguemtns. When you are satisfied with commands run "build"
and then "push" if you want to push the image.

Examples:

    make SCHEME=chibi VERSION=latest LINUX=alpine
    > DIR      : implementations/chibi/0
    > BUILD_CMD: docker build . -f Dockerfile.alpine --tag=schemers/chibi:alpine-latest
    > PUSH_CMD : docker push schemers/chibi:alpine-latest

    make SCHEME=chibi VERSION=latest
    > DIR      : implementations/chibi/0
    > BUILD_CMD: docker build . -f Dockerfile --tag=schemers/chibi:latest
    > PUSH_CMD : docker push schemers/chibi:latest

    make SCHEME=chibi VERSION=head
    > DIR      : implementations/chibi/head
    > BUILD_CMD: docker build . -f Dockerfile --tag=schemers/chibi:head
    > PUSH_CMD : docker push schemers/chibi:head


