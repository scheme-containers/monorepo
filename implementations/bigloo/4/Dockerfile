# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    autoconf \
    automake \
    libtool \
    patch \
    zip \
    sqlite3 \
    libc-dev \
    libgmp-dev \
    libunistring-dev \
    libpcre2-dev \
    libsqlite3-dev \
    libssl-dev \
    ca-certificates \
    default-jdk \
    wget \
  && rm -rf /var/lib/apt/lists/*
#RUN wget -O jdk-11.deb https://builds.openlogic.com/downloadJDK/openlogic-openjdk/11.0.28+6/openlogic-openjdk-11.0.28+6-linux-x64-deb.deb
#RUN apt-get install -y ./jdk-11.deb
WORKDIR /build
COPY checksum checksum
RUN wget -O bigloo.tar.gz https://www-sop.inria.fr/mimosa/fp/Bigloo/download/bigloo-latest.tar.gz
#RUN wget -O bigloo.tar.gz https://www-sop.inria.fr/mimosa/fp/Bigloo/download/bigloo-4.6a.tar.gz
#RUN sha256sum bigloo.tar.gz && sha256sum -c checksum
RUN mkdir bigloo && tar -C bigloo --strip-components 1 -xf bigloo.tar.gz
WORKDIR /build/bigloo
RUN ./configure
RUN make
RUN make compile-bee
RUN make install-sans-docs
RUN make fulltest

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    sqlite3 \
    libc-dev \
    libgmp-dev \
    libunistring-dev \
    libpcre2-dev \
    libsqlite3-dev \
    libssl-dev \
    ca-certificates \
    wget \
    default-jdk
COPY --from=build /usr/local/ /usr/local/
RUN ln -s bigloo /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
