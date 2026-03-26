# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    gcc-multilib \
    build-essential \
    autoconf \
    automake \
    libtool \
    wget \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O oaklisp.tar.gz https://github.com/barak/oaklisp/archive/refs/tags/debian/1.3.8-2.tar.gz
RUN sha256sum oaklisp.tar.gz && sha256sum -c checksum
RUN mkdir oaklisp && tar -C oaklisp --strip-components 1 -xf oaklisp.tar.gz
WORKDIR /build/oaklisp
RUN autoreconf --install
RUN ./configure --prefix=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s oaklisp /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
