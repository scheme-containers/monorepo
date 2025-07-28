# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    xz-utils \
    wget \
  && rm -rf /var/lib/apt/lists/*
RUN wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz && tar -xf rust.tar.xz
RUN cd rust-1.88.0-x86_64-unknown-linux-gnu && bash install.sh
WORKDIR /build
COPY checksum checksum
ADD https://github.com/raviqqe/stak/archive/refs/tags/v0.10.32.tar.gz stak.tar.gz
RUN sha256sum stak.tar.gz && sha256sum -c checksum
RUN mkdir stak && tar -C stak --strip-components 1 -xf stak.tar.gz
WORKDIR /build/stak
RUN cargo install stak --root /usr/local

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
