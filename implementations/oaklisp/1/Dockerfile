# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential autoconf automake libtool \
      gcc-multilib lib32gcc-8-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/barak/oaklisp/archive/upstream/1.3.7.tar.gz \
  oaklisp.tar.gz
RUN sha256sum oaklisp.tar.gz && sha256sum -c checksum
RUN mkdir oaklisp && tar -C oaklisp --strip-components 1 -xf oaklisp.tar.gz
WORKDIR /build/oaklisp
RUN autoreconf --install
RUN ./configure --disable-docs
RUN make
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      lib32gcc1 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s oaklisp /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
