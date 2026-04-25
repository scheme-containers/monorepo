# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    file \
    wget \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O sigscheme.tar.gz https://github.com/uim/sigscheme/releases/download/0.9.5/sigscheme-0.9.5.tar.gz
RUN sha256sum sigscheme.tar.gz && sha256sum -c checksum
RUN mkdir sigscheme && tar -C sigscheme --strip-components 1 -xf sigscheme.tar.gz
WORKDIR /build/sigscheme
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
