# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    git \
    libffi-dev \
    libfontconfig-dev \
    chezscheme \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/racket/racket.git --depth=1
WORKDIR /build/racket/racket/src
RUN ./configure --prefix=/usr/local \
    --disable-wpo --disable-compress --disable-iconv \
    --disable-curses --enable-cs-only --enable-scheme=chezscheme
RUN make PREFIX=/usr/local -j16 cs
RUN make PREFIX=/usr/local -j16 install-cs

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    libedit-dev \
    libfontconfig-dev \
    libcairo-5c0 \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
RUN raco pkg install --scope installation --auto --no-docs --jobs 8 --batch r6rs r7rs srfi
RUN ln -sf /usr/local/bin/racket /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
