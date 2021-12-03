# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/bigloo AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf automake libtool make patch zip \
      default-jdk-headless sqlite3 \
      gcc libc-dev libgmp-dev libunistring-dev \
      libpcre3-dev libsqlite3-dev libssl-dev \
      git ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/manuel-serrano/bigloo.git --depth 1 --tags
WORKDIR /build/bigloo
RUN ./configure
RUN LD_LIBRARY_PATH=/usr/local/lib/bigloo/4.4b \
      make bigboot BGLBUILDBINDIR=/usr/local/bin
RUN find /usr/local -type f -delete
RUN make install-progs
RUN make fullbootstrap-sans-log
RUN make install-sans-docs
RUN make fulltest

FROM debian:bullseye
RUN apt-get update && apt-get -y --no-install-recommends install \
      default-jre-headless sqlite3 \
      gcc libc-dev libgmp-dev libunistring-dev \
      libpcre3-dev libsqlite3-dev libssl-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s bigloo /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
