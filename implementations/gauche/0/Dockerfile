# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      pkg-config \
      ca-certificates \
      wget \
      netbase \
      openssh-client \
      libmbedtls-dev \
      zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O gauche.tgz https://github.com/shirok/Gauche/releases/download/release0_9_15/Gauche-0.9.15.tgz
RUN sha256sum gauche.tgz && sha256sum -c checksum
RUN mkdir gauche && tar -C gauche --strip-components 1 -xf gauche.tgz
WORKDIR /build/gauche
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libmbedtls21 ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner scheme-eval /usr/local/bin/
RUN ln -s gosh /usr/bin/scheme-r7rs
CMD ["scheme-banner"]
