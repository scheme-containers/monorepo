# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libedit2 \
      racket \
 && rm -rf /var/lib/apt/lists/*
COPY scheme-script /usr/local/bin/
RUN ln -s /usr/bin/racket /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
