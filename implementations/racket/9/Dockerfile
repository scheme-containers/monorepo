# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    libffi-dev \
    libfontconfig-dev \
    libcairo-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libedit-dev \
    chezscheme \
    wget \
    git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O racket.tgz \
    https://download.racket-lang.org/releases/9.2/installers/racket-minimal-9.2-src.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
WORKDIR /build/racket/src
RUN ./configure \
    --prefix=/usr/local \
    --enable-scheme=chezscheme \
    --enable-csonly \
    --disable-iconv \
    --disable-curses \
    --disable-docs
RUN make PREFIX=/usr/local -j$(nproc) cs
RUN make PREFIX=/usr/local -j$(nproc) install-cs
RUN raco pkg install --scope installation --auto --no-docs --jobs $(nproc) --batch r6rs r7rs

FROM debian:trixie-slim
COPY --from=build /usr/local /usr/local
RUN apt-get update \
    && apt-get -y --no-install-recommends install libedit-dev \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
