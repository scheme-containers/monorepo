# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    libffi-dev \
    chezscheme \
    wget \
    libjpeg62-turbo-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O racket.tgz https://download.racket-lang.org/releases/9.1/installers/racket-minimal-9.1-src.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
WORKDIR /build/racket/src
RUN ./configure --prefix=/usr/local
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
RUN raco pkg install --scope installation --no-docs --jobs 8 --batch \
    source-syntax srfi-lite-lib source-syntax errortrace-lib sandbox-lib \
    net-lib compatibility-lib r5rs-lib scheme-lib r6rs-lib zo-lib \
    compiler-lib testing-util-lib rackunit-lib r7rs-lib r7rs
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
