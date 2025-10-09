# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc6-dev \
      libx11-dev \
      uuid-dev \
      make \
      ncurses-dev \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O chezscheme.tar.gz https://github.com/cisco/ChezScheme/releases/download/v10.1.0/csv10.1.0.tar.gz
RUN sha256sum chezscheme.tar.gz && sha256sum -c checksum
RUN mkdir chezscheme && tar -C chezscheme -xf chezscheme.tar.gz --strip-components 1
WORKDIR /build/chezscheme
RUN ./configure --prefix=/usr/local
RUN make build
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local /usr/local
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY scheme-banner /usr/local/bin/
COPY chezscheme /usr/local/bin/
RUN ln -s scheme /usr/bin/scheme-script \
 && ln -s scheme /usr/bin/petite
CMD ["scheme-banner"]
