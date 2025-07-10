# -*- mode: dockerfile; coding: utf-8 -*-
FROM :bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    libedit-dev \
    libcairo2-dev \
    libjpeg-dev \
    libpango1.0-dev \
    libfontconfig-dev \
    git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/racket/racket.git --depth=1
WORKDIR /build/racket
RUN make unix-style PREFIX=/usr/local

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
