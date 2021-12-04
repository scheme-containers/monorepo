# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD http://www.larcenists.org/LarcenyReleases/larceny-1.3-bin-native-ia32-linux86.tar.gz larceny.tar.gz
RUN sha256sum larceny.tar.gz && sha256sum -c checksum
RUN mkdir /usr/local/lib/larceny
RUN tar -C /usr/local/lib/larceny --strip-components 1 -xf larceny.tar.gz

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libc6-i386 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/lib/larceny/ /usr/local/lib/larceny/
COPY scheme-banner scheme-script /usr/local/bin/
RUN ln -s ../lib/larceny/larceny /usr/local/bin/larceny
CMD ["scheme-banner"]
