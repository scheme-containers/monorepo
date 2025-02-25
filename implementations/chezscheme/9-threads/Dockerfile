# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc6-dev \
      libx11-dev \
      uuid-dev \
      make \
      ncurses-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/cisco/ChezScheme/releases/download/v9.6.4/csv9.6.4.tar.gz chezscheme.tar.gz
RUN sha256sum chezscheme.tar.gz && sha256sum -c checksum
RUN mkdir chezscheme && tar -C chezscheme --strip-components 1 --no-same-owner --no-same-permissions -xf chezscheme.tar.gz
WORKDIR /build/chezscheme
RUN ./configure --threads
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/lib/csv9.6.4/ /usr/lib/csv9.6.4/
COPY --from=build /usr/bin/scheme /usr/bin/
COPY scheme-banner /usr/local/bin/
RUN ln -s scheme /usr/bin/scheme-script \
 && ln -s scheme /usr/bin/petite
CMD ["scheme-banner"]
