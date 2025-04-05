# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       ca-certificates gcc libc6-dev libffi-dev libgmp-dev libreadline-dev \
       file make wget xz-utils build-essential automake autoconf libtool \
       texinfo \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY checksum checksum
RUN wget https://github.com/marcomaggi/vicare/archive/refs/tags/v0.4d1.2.tar.gz && mv v0.4d1.2.tar.gz vicare.tar.gz
RUN sha256sum vicare.tar.gz && sha256sum -c checksum
RUN tar -xf vicare.tar.gz && mv vicare-0.4d1.2 vicare
WORKDIR /build/vicare
RUN bash autogen.sh
RUN ./configure
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi8 \
       libgmp10 \
       libreadline8 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/vicare/ /usr/local/vicare/
COPY scheme-script /usr/local/bin/
RUN ln -s ../vicare/bin/vicare /usr/local/bin/vicare
RUN ln -s vicare /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
