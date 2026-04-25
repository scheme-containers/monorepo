# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
  git \
  ca-certificates \
  wget \
  xz-utils \
  make \
  build-essential \
  rsync \
  && rm -rf /var/lib/apt/lists/*
RUN if [ "$(uname --machine)" = "aarch64" ]; then wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-nightly-aarch64-unknown-linux-gnu.tar.xz; fi
RUN if [ "$(uname --machine)" = "x86_64" ]; then wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.xz; fi
RUN mkdir rust && tar -C rust --strip-components 1 -xf rust.tar.xz && cd rust && bash install.sh
WORKDIR /build
COPY checksum checksum
RUN wget -O steel.tar.gz https://github.com/mattwparas/steel/releases/download/v0.8.2/steel-source.tar.gz
RUN sha256sum steel.tar.gz && sha256sum -c checksum
RUN mkdir steel && tar -C steel --strip-components 1 -xf steel.tar.gz
WORKDIR /build/steel
RUN cargo xtask install

FROM debian:trixie-slim
COPY --from=build /usr/other/ /usr/other/
ENV PATH=/usr/other/bin:${PATH}
COPY scheme-banner /usr/local/bin/
RUN mkdir -p /root/.local/share/steel
CMD scheme-banner
