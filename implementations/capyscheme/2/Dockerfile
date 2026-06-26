# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:testing AS build
RUN apt-get update && apt-get install -y \
  git \
  ca-certificates \
  wget \
  xz-utils \
  make \
  build-essential \
  rsync \
  rustc \
  cargo \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O capy.tar.gz \
    https://codeberg.org/playXE/capy/archive/v2.0.0.tar.gz
RUN sha256sum capy.tar.gz && sha256sum -c checksum
RUN mkdir capy && tar -C capy --strip-components 1 -xf capy.tar.gz
WORKDIR /build/capy
RUN make PREFIX=/usr/local build
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y binutils
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
