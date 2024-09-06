# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates libedit2 racket \
 && rm -rf /var/lib/apt/lists/*
RUN raco pkg install --auto --no-docs r7rs
RUN ln -s racket /usr/local/bin/scheme-banner
COPY scheme-r7rs scheme-script /usr/local/bin/
CMD ["scheme-banner"]
