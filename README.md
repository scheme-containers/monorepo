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

### All

To build all images run:

    ./build


### Specific implementation

To build specific implementation run:

    ./build LINUX IMPLEMENTATION_NAME VERSION

Currently supported linuxes are debian and alpine

If version is omitted all versions will be built. See implementations.scm
for supported implementatons and versions.

### Adding implementation

Add implementation data into implementations.scm. There should be enough
examples by the previous implementations. See also templates/Dockerfile for
supported all supported fields.

Many build dependencies are already included in the image, check the
templates/Dockerfile.

In scheme-banner commands remember to double other than quotes.
For example newline \\n.
