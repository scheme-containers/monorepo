# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://download.racket-lang.org/releases/8.17/installers/racket-minimal-8.17-src.tgz racket.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
WORKDIR /build/racket/src
RUN ./configure --prefix=/usr/local
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    libedit-dev \
    libfontconfig \
    libcairo-5c0 \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
RUN raco pkg install --auto --no-docs r6rs
RUN raco pkg install --auto --no-docs r7rs
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
