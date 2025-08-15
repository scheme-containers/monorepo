# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git libedit-dev perl pkg-config \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/picrin-scheme/picrin/archive/refs/tags/v0.4.tar.gz picrin.tar.gz
RUN sha256sum picrin.tar.gz && sha256sum -c checksum
RUN mkdir picrin && tar -C picrin --strip-components 1 -xf picrin.tar.gz
WORKDIR /build/picrin
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libedit2 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
