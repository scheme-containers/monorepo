# -*- mode: dockerfile; coding: utf-8 -*-

# Need to use Debian sid because libck is not available in bullseye.

FROM debian:sid-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      libck-dev \
      libtommath-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/justinethier/cyclone-bootstrap/archive/v0.25.tar.gz cyclone-bootstrap.tar.gz
RUN sha256sum cyclone-bootstrap.tar.gz && sha256sum -c checksum
RUN mkdir cyclone && tar -C cyclone --strip-components 1 -xf cyclone-bootstrap.tar.gz
WORKDIR cyclone
RUN make
RUN make install
RUN make test

FROM debian:sid-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc libc-dev libck0 libck-dev libtommath1 libtommath-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s icyc /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
