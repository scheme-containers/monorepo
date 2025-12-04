# -*- mode: dockerfile; coding: utf-8 -*-
FROM rust:slim-trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    ca-certificates \
    wget \
    xz-utils \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/raviqqe/stak.git --depth=1
WORKDIR /build/stak
RUN cargo install stak --root /usr/other

FROM debian:trixie-slim
COPY --from=build /usr/other/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
