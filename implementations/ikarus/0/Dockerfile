# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    gcc-multilib \
    g++-multilib \
    ca-certificates \
    git \
    libffi-dev:i386 \
    libgmp-dev:i386 \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://files.scheme.org/ikarus-0.0.3.tar.gz ikarus.tar.gz
RUN sha256sum ikarus.tar.gz && sha256sum -c checksum
RUN mkdir ikarus && tar -C ikarus --strip-components 1 -xf ikarus.tar.gz
WORKDIR /build/ikarus
RUN ./configure --prefix=/usr/local --build=i686-pc-linux-gnu CFLAGS=-m32 CXXFLAGS=-m32 LDFLAGS=-m32
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8:i386 \
      libgmp10:i386 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s ikarus /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
