# -*- mode: dockerfile; coding: utf-8 -*-
FROM alpine:3.21 AS build
RUN apk add --no-cache \
      ca-certificates \
      curl \
      gcc \
      libx11-dev \
      util-linux-dev \
      make \
      ncurses-dev \
      musl-dev \
      wget
WORKDIR /build
COPY checksum checksum
RUN wget https://github.com/cisco/ChezScheme/releases/download/v9.6.4/csv9.6.4.tar.gz && mv csv9.6.4.tar.gz chezscheme.tar.gz
RUN sha256sum chezscheme.tar.gz && sha256sum -c checksum
RUN mkdir chezscheme && tar -C chezscheme --strip-components 1 --no-same-owner --no-same-permissions -xf chezscheme.tar.gz
WORKDIR /build/chezscheme
RUN ./configure
RUN make
RUN make install

FROM alpine:3.21
RUN apk add --no-cache \
      libuuid \
      ncurses
COPY --from=build /usr/lib/csv9.6.4/ /usr/lib/csv9.6.4/
COPY --from=build /usr/bin/scheme /usr/bin/
COPY scheme-banner /usr/local/bin/
RUN ln -s scheme /usr/bin/scheme-script \
 && ln -s scheme /usr/bin/petite
CMD ["scheme-banner"]
