# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/gauche:latest AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf automake libtool m4 git \
      build-essential pkg-config ca-certificates \
      netbase openssh-client libmbedtls-dev zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/shirok/Gauche.git gauche --depth 1 --tags
WORKDIR /build/gauche
RUN ./DIST gen
RUN ./configure
RUN make
RUN make install
RUN echo "Gauche ($(git describe --always --tags))" \
      >/usr/local/share/gauche-version

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libmbedtls12 ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -s gosh /usr/bin/scheme-r7rs
CMD ["scheme-banner"]
