# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
      libncurses-dev \
      m4 \
      make \
      texinfo \
      ca-certificates \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN if [ "$(uname --machine)" = "aarch64" ]; then wget -O mit-scheme-prebuilt.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/12.1/mit-scheme-12.1-aarch64le.tar.gz; fi
RUN if [ "$(uname --machine)" = "x86_64" ]; then wget -O mit-scheme-prebuilt.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/12.1/mit-scheme-12.1-x86-64.tar.gz; fi
RUN mkdir mit-scheme-prebuilt && tar -C mit-scheme-prebuilt --strip-components 1 -xf mit-scheme-prebuilt.tar.gz
WORKDIR /build/mit-scheme-prebuilt
RUN make
RUN make install
COPY checksum checksum
RUN wget -O mit-scheme.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/12.1/mit-scheme-12.1.tar.gz
RUN sha256sum mit-scheme.tar.gz && sha256sum -c checksum
RUN mkdir mit-scheme && tar -C mit-scheme --strip-components 1 -xf mit-scheme.tar.gz
WORKDIR /build/mit-scheme/src
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s mit-scheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
