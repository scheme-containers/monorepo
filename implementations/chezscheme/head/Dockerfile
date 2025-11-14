# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc6-dev \
      libx11-dev \
      uuid-dev \
      make \
      ncurses-dev \
      build-essential \
      ca-certificates \
      git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/cisco/ChezScheme.git --depth=1 --filter=blob:none chezscheme
WORKDIR /build/chezscheme
RUN ./configure --prefix=/usr/local
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
COPY --from=build /usr/local /usr/local
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY scheme-banner /usr/local/bin/
COPY chezscheme /usr/local/bin/
RUN ln -s scheme /usr/bin/chezscheme
RUN ln -s scheme /usr/bin/petite
CMD ["scheme-banner"]
