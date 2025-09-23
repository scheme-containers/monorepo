# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      curl \
      unzip \
      zip \
      wget \
      openjdk-11-jdk
WORKDIR /build
COPY checksum checksum
RUN wget -O kawa.tar.gz https://ftp.gnu.org/pub/gnu/kawa/kawa-3.1.1.tar.gz
RUN sha256sum kawa.tar.gz && sha256sum -c checksum
RUN mkdir kawa && tar -C kawa --strip-components 1 -xf kawa.tar.gz
WORKDIR kawa
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates \
    openjdk-25-jdk
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin
COPY scheme-r7rs /usr/local/bin
CMD ["scheme-banner"]
