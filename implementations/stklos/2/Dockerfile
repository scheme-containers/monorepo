# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential file texinfo \
      libffi-dev libgc-dev libgmp-dev libpcre3-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://stklos.net/download/stklos-2.10.tar.gz stklos.tar.gz
RUN sha256sum stklos.tar.gz && sha256sum -c checksum
RUN mkdir stklos && tar -C stklos --strip-components 1 -xf stklos.tar.gz
WORKDIR /build/stklos
RUN ./configure \
  --without-provided-bignum --without-provided-gc --without-provided-regexp
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8 libgc1 libgmp10 libpcre3 libreadline8 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
COPY scheme-r7rs /usr/local/bin/scheme-r7rs
RUN ln -s libreadline.so.7.0 /lib/x86_64-linux-gnu/libreadline.so
CMD ["scheme-banner"]
