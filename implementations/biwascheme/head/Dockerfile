# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    nodejs \
    npm \
    ca-certificates \
    git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/biwascheme/biwascheme.git
WORKDIR /build/biwascheme
RUN npm install
RUN npm run build
RUN npm pack
RUN npm -g install biwascheme*.tgz
RUN ln -s biwas /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
