# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      m4 \
      ca-certificates \
      wget \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY checksum checksum
RUN wget -O mit-scheme.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/10.1.11/mit-scheme-10.1.11-x86-64.tar.gz
RUN sha256sum mit-scheme.tar.gz && sha256sum -c checksum
RUN mkdir mit-scheme && tar -C mit-scheme --strip-components 1 -xf mit-scheme.tar.gz
WORKDIR /build/mit-scheme/src
RUN ./configure
RUN make CFLAGS=-std=gnu89
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s mit-scheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
