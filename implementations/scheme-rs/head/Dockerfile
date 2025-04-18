# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git ca-certificates llvm llvm-dev rust-all libpolly-19-dev build-essential zlib1g-dev libzstd-dev \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/maplant/scheme-rs.git scheme-rs --depth 1
WORKDIR /build/scheme-rs
RUN cargo build

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y libffi8
COPY --from=build /build/scheme-rs /build/scheme-rs
ENV PATH=/build/scheme-rs/target/debug:${PATH}
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
