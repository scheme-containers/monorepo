# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
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
    wget
RUN wget -O jdk-8.deb https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u442-b06/openlogic-openjdk-8u442-b06-linux-x64-deb.deb
RUN apt-get install -y ./jdk-8.deb
WORKDIR /build
COPY checksum checksum
RUN wget -O bigloo.tar.gz ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo4.3g.tar.gz
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
    build-essential \
    sqlite3 \
    libc-dev \
    libgmp-dev \
    libunistring-dev \
    libpcre3-dev \
    libsqlite3-dev \
    libssl-dev \
    ca-certificates \
    wget
RUN wget -O jdk-8.deb https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u442-b06/openlogic-openjdk-8u442-b06-linux-x64-deb.deb
RUN apt-get install -y ./jdk-8.deb
COPY --from=build /usr/local/ /usr/local/
RUN ln -s bigloo /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
