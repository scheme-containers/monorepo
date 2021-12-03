# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim

RUN apt-get update && apt-get -y --no-install-recommends install \
      npm \
 && rm -rf /var/lib/apt/lists/*
RUN npm install -g biwascheme
RUN ln -s biwas /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
