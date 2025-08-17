# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      autoconf \
      automake \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O shoe.tar.gz https://github.com/lassik/scheme-release-archive/raw/master/shoe/shoe-0.20.2.tar.gz
RUN sha256sum shoe.tar.gz && sha256sum -c checksum
RUN mkdir shoe && tar -C shoe --strip-components 1 -xf shoe.tar.gz
WORKDIR /build/shoe/src
RUN ./mkconfigure
RUN ./configure --prefix=/usr/local
RUN make CFLAGS=-std=gnu89
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s shoe /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
