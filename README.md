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

### Building the base build image

Run:

    make build-base
