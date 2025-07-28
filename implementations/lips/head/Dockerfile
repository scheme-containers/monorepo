# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      nodejs \
      npm \
      ca-certificates \
      git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/jcubic/lips.git --depth=1
WORKDIR /build/lips
RUN npm install
RUN npm pack
RUN npm install -g lips*.tgz
RUN ln -s lips /usr/local/bin/scheme-banner \
 && ln -s lips /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
