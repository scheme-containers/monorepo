# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
      clang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O skint.tar.gz https://github.com/false-schemers/skint/archive/refs/tags/v0.6.8.tar.gz
RUN sha256sum skint.tar.gz && sha256sum -c checksum
RUN mkdir skint && tar -C skint --strip-components 1 -xf skint.tar.gz
WORKDIR /build/skint
RUN ./configure --prefix=/usr/local
RUN make CC=clang
RUN make test
RUN make install
RUN make libtest
RUN make libinstall

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s skint /usr/local/bin/scheme-banner \
 && ln -s skint /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
