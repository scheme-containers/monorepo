# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/false-schemers/skint/archive/refs/tags/v011.tar.gz skint.tar.gz
RUN sha256sum skint.tar.gz && sha256sum -c checksum
RUN mkdir skint && tar -C skint --strip-components 1 -xf skint.tar.gz
WORKDIR /build/skint
RUN gcc -o skint [skint].c -lm
RUN install skint /usr/local/bin/

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -s skint  /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
