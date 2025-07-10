# -*- mode: dockerfile; coding: utf-8 -*-
FROM rust:slim-bookworm AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/raviqqe/stak.git --depth=1
WORKDIR /build/stak
#RUN cargo build
RUN cargo install stak --root /usr/local

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD scheme-banner
