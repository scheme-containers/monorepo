# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    rust-all \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/raviqqe/stak/archive/refs/tags/v0.10.24.tar.gz stak.tar.gz
RUN sha256sum stak.tar.gz && sha256sum -c checksum
RUN mkdir stak && tar -C stak --strip-components 1 -xf stak.tar.gz
WORKDIR /build/stak
RUN cargo install stak --locked --root /usr/local

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
