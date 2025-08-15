# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O scheme48.tgz http://www.s48.org/1.9.2/scheme48-1.9.2.tgz
RUN sha256sum scheme48.tgz && sha256sum -c checksum
RUN mkdir scheme48 && tar -C scheme48 --strip-components 1 -xf scheme48.tgz
WORKDIR /build/scheme48
RUN ./configure CFLAGS=-std=gnu89
RUN make CFLAGS=-std=gnu89
#RUN make test  # Works, but takes quite a while.
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scheme48 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
