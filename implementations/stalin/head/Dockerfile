# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    stalin gcc libc-dev \
 && rm -rf /var/lib/apt/lists/*
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
