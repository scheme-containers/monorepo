# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    wget \
    xz-utils \
  && rm -rf /var/lib/apt/lists/*
RUN wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.xz
RUN mkdir rust && tar -C rust --strip-components 1 -xf rust.tar.xz && cd rust && bash install.sh
WORKDIR /build
COPY checksum checksum
RUN wget -O stak.tar.gz https://github.com/raviqqe/stak/archive/refs/tags/v0.10.39.tar.gz
RUN sha256sum stak.tar.gz && sha256sum -c checksum
RUN mkdir stak && tar -C stak --strip-components 1 -xf stak.tar.gz
WORKDIR /build/stak
RUN cargo install stak --root /usr/local

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
