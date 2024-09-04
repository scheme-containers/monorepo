# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git npm nodejs \
 && rm -rf /var/lib/apt/lists/*
RUN npm install -g @jcubic/lips@beta
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
