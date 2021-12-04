# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential cpio \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://files.scheme.org/rs-0.7.3.4-b7.tar.gz rscheme.tar.gz
RUN sha256sum rscheme.tar.gz && sha256sum -c checksum
RUN mkdir rscheme && tar -C rscheme --strip-components 1 -xf rscheme.tar.gz
WORKDIR /build/rscheme
RUN make stage1
WORKDIR /build/rscheme/src
RUN ./configure --prefix=/usr/local
RUN make all
RUN make packages
RUN make fasl_shell

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s rs /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
