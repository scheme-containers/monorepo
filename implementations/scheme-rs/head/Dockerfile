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
RUN git clone https://github.com/maplant/scheme-rs.git --depth=1
WORKDIR /build/scheme-rs
RUN cargo install --path=. --root=/usr/other --features "async,tokio"

FROM debian:trixie-slim
COPY --from=build /usr/other/ /usr/other/
ENV PATH=/usr/other/bin:${PATH}
COPY scheme-banner /usr/local/bin/
CMD scheme-banner
