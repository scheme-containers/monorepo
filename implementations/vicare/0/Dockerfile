# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       ca-certificates \
       gcc \
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
    expectedSha256="47c6b275ce8abf9fe4e0fd7f1b895e45db85e9ed326b75afdf8c75d1eac73163"; \
    url="https://bitbucket.org/marcomaggi/vicare-scheme/downloads/vicare-scheme-0.4.1-devel.3.tar.xz"; \
    wget --no-verbose "$url" -O vs.tar.xz; \
    echo "${expectedSha256} *vs.tar.xz" | sha256sum -c -; \
    mkdir vs; \
    tar -C vs --strip-components 1 -xaf vs.tar.xz; \
    rm vs.tar.xz
WORKDIR vs
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
