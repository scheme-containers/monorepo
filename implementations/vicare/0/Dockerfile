# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       ca-certificates \
       gcc \
       libtool \
       m4 \
       texinfo \
       autoconf \
       automake \
       libc6-dev \
       libffi-dev \
       libgmp-dev \
       libreadline-dev \
       file \
       make \
       wget \
       xz-utils \
  && rm -rf /var/lib/apt/lists/*

RUN set -uxe; \
    expectedSha256="577dd0831c9bc260cc283671e8be16b23af998ff4a21f95ff07957033482843d"; \
    url="https://github.com/marcomaggi/vicare/archive/refs/tags/v0.4d1.tar.gz"; \
    wget --no-verbose "$url" -O vs.tar.xz; \
    echo "${expectedSha256} *vs.tar.xz" | sha256sum -c -; \
    mkdir vs; \
    tar -C vs --strip-components 1 -xaf vs.tar.xz; \
    rm vs.tar.xz
WORKDIR vs
RUN sh autogen.sh
RUN set -uxe; \
    ./configure --prefix=/usr/local/vicare; \
    make; \
    make install; \
    make clean

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi7 \
       libgmp10 \
       libreadline8 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/vicare/ /usr/local/vicare/
COPY scheme-script /usr/local/bin/
RUN ln -s ../vicare/bin/vicare /usr/local/bin/vicare
RUN ln -s vicare /usr/local/bin/scheme-banner
CMD ["scheme-banner"]