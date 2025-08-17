# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/scheme48:1 AS build
RUN rm -f /usr/local/bin/scheme-banner
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/scheme/scsh.git --depth=1
WORKDIR /build/scsh
RUN git submodule update --init
RUN autoupdate
RUN autoreconf
RUN ./configure
RUN make CFLAGS="-fpic -std=gnu89 -lutil"
RUN make test
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scsh /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
