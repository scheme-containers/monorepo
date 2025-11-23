# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    libffi-dev \
    chezscheme \
    wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
#RUN wget -O racket.tgz https://download.racket-lang.org/releases/8.18/installers/racket-minimal-8.18-src.tgz
RUN wget -O racket.tgz https://download.racket-lang.org/releases/9.0/installers/racket-minimal-9.0-src.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
WORKDIR /build/racket/src
RUN ./configure --prefix=/usr/local \
    --disable-wpo --disable-compress --disable-iconv \
    --disable-curses --enable-cs-only --enable-scheme=chezscheme
RUN make PREFIX=/usr/local -j16 cs
RUN make PREFIX=/usr/local -j16 install-cs

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    libffi-dev \
    libpango1.0-dev \
    libfontconfig-dev \
    libcairo-dev \
    libjpeg-dev \
    libedit-dev \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
RUN raco pkg install --scope installation --auto --no-docs --jobs 8 --batch r6rs r7rs
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
