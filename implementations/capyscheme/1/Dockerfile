# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get install -y \
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
RUN mkdir rust && tar -C rust --strip-components 1 -xf rust.tar.xz && cd rust && sh install.sh
WORKDIR /build
COPY checksum checksum
RUN wget -O capy.tar.gz https://codeberg.org/playXE/capy/archive/v1.2.0.tar.gz
RUN sha256sum capy.tar.gz && sha256sum -c checksum
RUN mkdir capy && tar -C capy --strip-components 1 -xf capy.tar.gz
WORKDIR /build/capy
RUN make COMPILE_PSYNTAX=1 PREFIX=/usr/other build
RUN make PREFIX=/usr/other install

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y binutils
COPY --from=build /usr/other/ /usr/other/
RUN cp -r /usr/other/* /usr/local/
RUN ldconfig
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
CMD scheme-banner
