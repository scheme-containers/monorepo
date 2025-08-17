# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O elk.tar.gz http://sam.zoy.org/elk/elk-3.99.8.tar.gz
RUN sha256sum elk.tar.gz && sha256sum -c checksum
RUN mkdir elk && tar -C elk --strip-components 1 -xf elk.tar.gz
WORKDIR /build/elk
RUN ./configure
RUN make CFLAGS=-std=gnu89
RUN make install
COPY write-scheme-version write-scheme-version
RUN ./write-scheme-version | tee /usr/local/share/scheme-version

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
