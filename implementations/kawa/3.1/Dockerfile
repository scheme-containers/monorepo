# -*- mode: dockerfile; coding: utf-8 -*-
# Installing the JDK or the JRE does not seem to work in bullseye-slim.
FROM debian:bullseye AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      default-jdk-headless \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://ftp.gnu.org/pub/gnu/kawa/kawa-3.1.1.tar.gz kawa.tar.gz
RUN sha256sum kawa.tar.gz && sha256sum -c checksum
RUN mkdir kawa && tar -C kawa --strip-components 1 -xf kawa.tar.gz
WORKDIR kawa
RUN ./configure
RUN make
RUN make install

FROM debian:bullseye
RUN apt-get update && apt-get -y --no-install-recommends install \
      default-jre-headless \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
