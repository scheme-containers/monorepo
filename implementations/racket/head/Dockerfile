# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    git \
    libffi-dev \
    chezscheme \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/racket/racket.git --depth=1
WORKDIR /build/racket
RUN make unix-style PREFIX=/usr/local
#RUN ./configure --prefix=/usr/local --enable-scheme=chezscheme
#RUN make PREFIX=/usr/local -j8 cs
#RUN make PREFIX=/usr/local -j8 install-cs

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
