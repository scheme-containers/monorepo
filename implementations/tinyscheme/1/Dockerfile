# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
        build-essential \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://sourceforge.net/projects/tinyscheme/files/tinyscheme/tinyscheme-1.41/tinyscheme-1.41.tar.gz/download \
  tinyscheme.tar.gz
RUN sha256sum tinyscheme.tar.gz && sha256sum -c checksum
RUN mkdir tinyscheme && tar -C tinyscheme --strip-components 1 -xf tinyscheme.tar.gz
WORKDIR /build/tinyscheme
RUN make

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libncurses6 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /build/tinyscheme/init.scm /build/tinyscheme/scheme \
  /usr/local/tinyscheme/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
