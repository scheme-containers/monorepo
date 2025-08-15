# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O s7.tar.gz https://ccrma.stanford.edu/software/s7/s7.tar.gz
RUN sha256sum s7.tar.gz && sha256sum -c checksum
RUN mkdir s7 && tar -C s7 --strip-components 1 -xf s7.tar.gz
WORKDIR /build/s7
RUN echo '#define S7_LOAD_PATH "/usr/local/lib/s7"' >mus-config.h
RUN gcc s7.c -o s7 -DWITH_MAIN -I. -O2 -g -ldl -lm -Wl,-export-dynamic
RUN ./s7 libc.scm
RUN mkdir /usr/local/lib/s7 \
    && cp *.scm libc_s7.so /usr/local/lib/s7/ \
    && cp -v s7 /usr/local/bin/

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s s7 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
