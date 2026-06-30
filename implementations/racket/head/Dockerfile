# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    git \
    libfontconfig-dev \
    libpango1.0-dev \
    libfontconfig-dev \
    libcairo-dev \
    libjpeg-dev \
    libedit-dev \
    chezscheme \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/racket/racket.git --depth=1
WORKDIR /build/racket/racket/src
RUN ./configure --prefix=/usr/local --enable-scheme=chezscheme
RUN make PREFIX=/usr/local -j$(nproc) cs
RUN make PREFIX=/usr/local -j$(nproc) install-cs

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates
COPY --from=build /usr/local /usr/local
RUN raco pkg install --scope installation --auto --no-docs --jobs 8 --batch r6rs r7rs srfi
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
