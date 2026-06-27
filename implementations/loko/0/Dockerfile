# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      make \
      build-essential \
      autoconf \
      automake \
      guile-3.0 \
      guile-3.0-dev \
      git \
      ca-certificates \
      libcurl4-openssl-dev \
      pkg-config \
      chezscheme \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O loko.tar.gz \
    https://gitlab.com/weinholt/loko/-/archive/v0.13.0/loko-v0.13.0.tar.gz
RUN wget -O akku.tar.gz https://gitlab.com/akkuscm/akku/-/archive/v1.1.0/akku-v1.1.0.tar.gz

COPY checksum checksum
RUN sha256sum akku.tar.gz loko.tar.gz && sha256sum -c checksum

RUN mkdir akku && tar -C akku --strip-components 1 -xf akku.tar.gz
RUN mkdir loko && tar -C loko --strip-components 1 -xf loko.tar.gz

WORKDIR /build/akku
RUN ./bootstrap
RUN ./configure GUILD=/usr/bin/guild GUILE_CONFIG=/usr/bin/guile-config
RUN make
RUN make install

WORKDIR /build/loko
RUN akku --debug install
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      guile-3.0 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
RUN ln -s loko /usr/local/bin/scheme-banner \
 && ln -s loko /usr/local/bin/scheme-script
CMD ["scheme-banner"]
