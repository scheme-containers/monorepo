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
WORKDIR /build
RUN git clone https://github.com/manuel-serrano/bigloo.git --depth=1
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
