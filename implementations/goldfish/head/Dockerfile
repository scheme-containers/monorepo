# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      xmake \
      cmake \
      libssl-dev \
      pkg-config \
      libcurl4-openssl-dev \
      libtbox-dev \
      unzip \
      git \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/MoganLab/goldfish.git --depth 1
WORKDIR /build/goldfish
ENV XMAKE_ROOT=y
RUN xmake b -y goldfish
RUN xmake i -o /usr/local

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libcurl4t64 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
