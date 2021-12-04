# -*- mode: dockerfile; coding: utf-8 -*-

# TODO: This uses Jessie because newer gcc versions miscompile Mosh

FROM schemers/mosh AS build
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
WORKDIR /build
RUN git clone git://github.com/higepon/mosh.git --depth 1
WORKDIR /build/mosh
RUN ./gen-git-build.sh
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
CMD ["scheme-banner"]
