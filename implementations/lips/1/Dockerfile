# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      nodejs \
      npm \
      ca-certificates \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O lips.tgz \
    https://github.com/jcubic/lips/archive/refs/tags/1.0.0-beta.23.1.tar.gz
RUN sha256sum lips.tgz && sha256sum -c checksum
RUN mkdir lips && tar -C lips --strip-components 1 -xf lips.tgz
WORKDIR /build/lips
RUN npm install -g

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      nodejs \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -sf lips /usr/local/bin/scheme-banner \
 && ln -sf lips /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
