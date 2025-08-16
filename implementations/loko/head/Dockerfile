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
COPY checksum checksum
RUN wget -O akku.tar.gz https://gitlab.com/akkuscm/akku/-/archive/v1.1.0/akku-v1.1.0.tar.gz
RUN sha256sum akku.tar.gz && sha256sum -c checksum
RUN mkdir akku && tar -C akku --strip-components 1 -xf akku.tar.gz
WORKDIR /build/akku
RUN ./bootstrap
RUN ./configure GUILD=/usr/bin/guild GUILE_CONFIG=/usr/bin/guile-config
RUN make
RUN make install
WORKDIR /build
RUN git clone https://gitlab.com/weinholt/loko.git --depth=1
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
