# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git rsync \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://ccrma.stanford.edu/software/s7/s7-01Jan21.tar.gz s7.tar.gz
RUN sha256sum s7.tar.gz && sha256sum -c checksum
RUN mkdir s7 && tar -C s7 --strip-components 1 -xf s7.tar.gz
WORKDIR /build/s7
RUN echo '#define S7_LOAD_PATH "/usr/local/lib/s7"' >mus-config.h
RUN gcc -o s7 s7.c -ldl -lm -rdynamic -O2 -g -I . -D WITH_MAIN
RUN ./s7 libc.scm
RUN find . -name '*.scm' | rsync -va --files-from - ./ /usr/local/lib/s7/ \
 && cp -v libc_s7.so /usr/local/lib/s7/ \
 && cp -v s7 /usr/local/bin/

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s s7 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
