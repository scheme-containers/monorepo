# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      clang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/JeffBezanson/femtolisp.git --depth 1
WORKDIR /build/femtolisp
RUN make CC=clang CFLAGS=-std=gnu89
RUN mkdir -p /usr/local/bin
RUN cp -p flisp.boot /usr/local/bin/flisp.boot
RUN cp -p flisp /usr/local/bin/

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s flisp /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
