# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       build-essential \
       cmake \
       libffi-dev \
       libgc-dev \
       libssl-dev \
       libz-dev \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/sagittarius-0.9.6.tar.gz \
        sagittarius.tar.gz
RUN sha256sum sagittarius.tar.gz && sha256sum -c checksum
RUN mkdir sagittarius \
  && tar -C sagittarius --strip-components 1 -xf sagittarius.tar.gz
WORKDIR /build/sagittarius
RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr/local
RUN make
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi7 \
       libgc1 \
       libssl1.1 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner scheme-r7rs scheme-script /usr/local/bin/
RUN ldconfig
CMD scheme-banner
