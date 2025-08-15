# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O siod.tgz https://people.delphiforums.com/gjc/siod.tgz
RUN sha256sum siod.tgz && sha256sum -c checksum
RUN mkdir siod
WORKDIR /build/siod
RUN tar -xf ../siod.tgz
RUN make CFLAGS=-std=gnu89 linux
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s siod /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
