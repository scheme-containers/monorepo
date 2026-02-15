# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       build-essential \
       cmake \
       libffi-dev \
       libgc-dev \
       libssl-dev \
       libz-dev \
       wget \
       ca-certificates \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O sagittarius.tar.gz https://github.com/ktakashi/sagittarius-scheme/releases/download/v0.9.14/sagittarius-0.9.14.tar.gz
RUN sha256sum sagittarius.tar.gz && sha256sum -c checksum
RUN mkdir sagittarius && tar -C sagittarius --strip-components 1 -xf sagittarius.tar.gz
WORKDIR /build/sagittarius
RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi8 \
       libgc1 \
       libssl3 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner scheme-r7rs scheme-script /usr/local/bin/
RUN ldconfig
CMD scheme-banner
