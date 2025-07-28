# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       build-essential \
       cmake \
       libffi-dev \
       libgc-dev \
       libssl-dev \
       libz-dev \
       bash \
       git ca-certificates \
       wget \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/ktakashi/sagittarius-scheme/releases/download/v0.9.13/sagittarius-0.9.13.tar.gz
RUN tar -xf sagittarius-0.9.13.tar.gz
RUN cd sagittarius-0.9.13 && cmake . && make && make install
WORKDIR /build
RUN git clone https://github.com/ktakashi/sagittarius-scheme.git \
      sagittarius --depth 1
WORKDIR /build/sagittarius
RUN ./dist.sh gen
RUN cmake .
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi8 \
       libgc1 \
       libssl3 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner scheme-r7rs scheme-script /usr/local/bin/
RUN ldconfig
CMD scheme-banner
