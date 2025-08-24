# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      clang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/false-schemers/skint.git --depth=1
WORKDIR /build/skint
RUN ./configure --prefix=/usr/local
RUN make CC=clang
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s skint /usr/local/bin/scheme-banner \
 && ln -s skint /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
