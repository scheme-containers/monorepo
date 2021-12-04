# -*- mode: dockerfile; coding: utf-8 -*-

# TODO: This uses Jessie because newer gcc versions miscompile Mosh

FROM debian:jessie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf \
      automake \
      bison \
      build-essential \
      ca-certificates \
      cpio \
      gauche \
      git \
      libffi-dev \
      libgmp-dev \
      libonig-dev \
      libssl-dev \
      pkg-config \
      re2c \
 && rm -rf /var/lib/apt/lists/*
COPY onig-config /usr/local/bin/
WORKDIR /build
COPY checksum checksum
ADD http://storage.osdev.info/pub/mosh/mosh-current.tar.gz mosh.tar.gz
RUN sha256sum mosh.tar.gz && sha256sum -c checksum
RUN mkdir mosh && tar -C mosh --strip-components 1 -xf mosh.tar.gz
WORKDIR /build/mosh
RUN ./configure
RUN make
RUN make install

FROM debian:jessie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libssl1.0.0 \
      libffi7 \
      libgmp10 \
      libonig2 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -s mosh /usr/local/bin/scheme-script
CMD ["scheme-banner"]
