# -*- mode: dockerfile; coding: utf-8 -*-
FROM alpine:3.8 AS build
RUN apk add --no-cache \
      ca-certificates \
      curl \
      gcc \
      libx11-dev \
      util-linux-dev \
      make \
      ncurses-dev \
      musl-dev
WORKDIR /build
COPY checksum checksum
ADD https://github.com/cisco/ChezScheme/releases/download/v9.5.4/csv9.5.4.tar.gz chezscheme.tar.gz
RUN sha256sum chezscheme.tar.gz && sha256sum -c checksum
RUN mkdir chezscheme && tar -C chezscheme --strip-components 1 --no-same-owner --no-same-permissions -xf chezscheme.tar.gz
WORKDIR /build/chezscheme
RUN sed -ie 's,#include <xlocale.h>,,' c/expeditor.c  # Alpine only.
RUN sed -ie 's,expeditor,,' s/*.def
RUN ./configure --workarea=build --threads  # Different with/without threads.
RUN make -C build
RUN make -C build clean
RUN sed -ie 's,-lncurses,,' c/Mf-*
RUN rm build/boot/*/equates.h
RUN cp -fr build/boot/* boot/
RUN make clean && rm -rf build
RUN ./configure --workarea=build --threads  # Different with/without threads.
RUN make -C build
RUN make install
RUN rm -rf /usr/lib/csv9.5.4/examples
RUN scheme --version

FROM alpine:3.8
RUN apk add --no-cache \
      libuuid \
      ncurses
COPY --from=build /usr/lib/csv9.5.4/ /usr/lib/csv9.5.4/
COPY --from=build /usr/bin/scheme /usr/bin/
COPY scheme-banner /usr/local/bin/
RUN ln -s scheme /usr/bin/scheme-script \
 && ln -s scheme /usr/bin/petite
CMD ["scheme-banner"]
