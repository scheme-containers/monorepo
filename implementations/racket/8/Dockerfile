# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    wget \
    libedit-dev \
    libfontconfig-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O racket.tgz https://download.racket-lang.org/releases/8.18/installers/racket-8.18-src.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
WORKDIR /build/racket/src
RUN ./configure --prefix=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    libedit-dev \
    libfontconfig \
    libcairo-5c0 \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
RUN raco pkg install --scope installation --auto --no-docs r6rs
RUN raco pkg install --scope installation --auto --no-docs r7rs
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
