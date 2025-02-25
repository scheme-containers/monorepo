# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf automake libtool make patch zip \
      default-jdk-headless sqlite3 \
      gcc libc-dev libgmp-dev libunistring-dev \
      libpcre2-dev libsqlite3-dev libssl-dev \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo-4.5a-1.tar.gz && mv bigloo-4.5a-1.tar.gz bigloo.tar.gz
RUN sha256sum bigloo.tar.gz && sha256sum -c checksum
RUN mkdir bigloo && tar -C bigloo --strip-components 1 -xf bigloo.tar.gz
WORKDIR /build/bigloo
RUN ./configure --bee=full --jvm=yes
RUN make
RUN make compile-bee
RUN make install-sans-docs
RUN make fulltest

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      default-jre-headless sqlite3 \
      gcc libc-dev libgmp-dev libunistring-dev \
      libpcre3-dev libsqlite3-dev libssl-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s bigloo /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
