# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    libffi-dev \
    libfontconfig-dev \
    libpango1.0-dev \
    libfontconfig-dev \
    libcairo-dev \
    libjpeg-dev \
    libedit-dev \
    chezscheme \
    wget \
    libjpeg62-turbo-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O racket.tgz \
    https://download.racket-lang.org/releases/9.2/installers/racket-9.2-src.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
WORKDIR /build/racket/src
RUN ./configure --prefix=/usr/local --enable-scheme=chezscheme
RUN make PREFIX=/usr/local -j$(nproc) cs
RUN make PREFIX=/usr/local -j$(nproc) install-cs

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
RUN raco pkg install --scope installation --auto --no-docs --jobs 8 --batch r6rs r7rs srfi
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
