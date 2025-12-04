# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    ca-certificates \
    wget \
    xz-utils \
  && rm -rf /var/lib/apt/lists/*
RUN if [ "$(uname --machine)" = "aarch64" ]; then wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-nightly-aarch64-unknown-linux-gnu.tar.xz; fi
RUN if [ "$(uname --machine)" = "x86_64" ]; then wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.xz; fi
RUN mkdir rust && tar -C rust --strip-components 1 -xf rust.tar.xz && cd rust && bash install.sh
WORKDIR /build
RUN git clone https://github.com/raviqqe/stak.git --depth=1
WORKDIR /build/stak
RUN cargo install stak --root /usr/other

FROM debian:trixie-slim
COPY --from=build /usr/other/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
