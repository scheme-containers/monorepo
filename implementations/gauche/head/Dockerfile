# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf \
      automake \
      texinfo \
      bzip2 \
      libtool \
      m4 \
      git \
      build-essential \
      pkg-config \
      ca-certificates \
      netbase \
      openssh-client \
      libmbedtls-dev \
      zlib1g-dev \
      libffi-dev \
      wget \
 && rm -rf /var/lib/apt/lists/*
# Build Gauche to bootstrap head
WORKDIR /build
COPY checksum checksum
RUN wget -O gauche.tgz https://github.com/shirok/Gauche/releases/download/release0_9_15/Gauche-0.9.15.tgz
RUN sha256sum gauche.tgz && sha256sum -c checksum
RUN mkdir gauche && tar -C gauche --strip-components 1 -xf gauche.tgz
WORKDIR /build/gauche
RUN ./configure
RUN make
RUN make install
WORKDIR /build
RUN rm -rf gauche
# Head build
RUN git clone https://github.com/shirok/Gauche.git gauche --depth 1 --tags
WORKDIR /build/gauche
RUN ./DIST gen
RUN ./configure
RUN make
RUN make install
RUN echo "Gauche ($(git describe --always --tags))" \
      >/usr/local/share/gauche-version

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libmbedtls21 \
      ca-certificates \
      libffi-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -s gosh /usr/bin/scheme-r7rs
CMD ["scheme-banner"]
