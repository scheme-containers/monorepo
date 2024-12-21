# -*- mode: dockerfile; coding: utf-8 -*-

FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y install \
      autoconf \
      automake \
      bison \
      build-essential \
      ca-certificates \
      cpio \
      git \
      libffi-dev \
      libgmp-dev \
      libonig-dev \
      libssl-dev \
      pkg-config \
      re2c
COPY onig-config /usr/local/bin/
WORKDIR /build
COPY checksum checksum
ADD https://github.com/higepon/mosh/releases/download/mosh-0.2.9-rc1/mosh-0.2.9-rc1.tar.gz mosh.tar.gz
RUN sha256sum mosh.tar.gz && sha256sum -c checksum
RUN mkdir mosh && tar -C mosh --strip-components 1 -xf mosh.tar.gz
WORKDIR /build/mosh
RUN ./configure
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libssl3 \
      libffi8 \
      libgmp10 \
      libonig5 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -s mosh /usr/local/bin/scheme-script
CMD ["scheme-banner"]
