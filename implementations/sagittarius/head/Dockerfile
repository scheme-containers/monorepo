# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/sagittarius AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       build-essential \
       cmake \
       libffi-dev \
       libgc-dev \
       libssl-dev \
       libz-dev \
       git ca-certificates \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://bitbucket.org/ktakashi/sagittarius-scheme.git \
      sagittarius --depth 1
WORKDIR /build/sagittarius
RUN ./dist.sh gen
RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr/local
RUN make
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi7 \
       libgc1 \
       libssl1.1 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner scheme-r7rs scheme-script /usr/local/bin/
RUN ldconfig
CMD scheme-banner
