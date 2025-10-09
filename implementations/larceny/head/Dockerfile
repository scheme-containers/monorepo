# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    lib32z1-dev \
    wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN if [ "$(uname --machine)" = "aarch64" ]; then wget -O larceny-prebuilt.tar.gz https://larcenists.org/LarcenyReleases/larceny-1.3-bin-native-armv7l-linux.tar.gz; fi
RUN if [ "$(uname --machine)" = "x86_64" ]; then wget -O larceny-prebuilt.tar.gz https://larcenists.org/LarcenyReleases/larceny-1.3-bin-native-ia32-linux86.tar.gz; fi
RUN mkdir /usr/local/lib/larceny
RUN tar -C /usr/local/lib/larceny --strip-components 1 -xf larceny-prebuilt.tar.gz

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    lib32z1 \
    libc6-i386 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/lib/larceny/ /usr/local/lib/larceny/
COPY scheme-banner /usr/local/bin/
RUN ln -s ../lib/larceny/larceny /usr/local/bin/larceny
RUN ln -s ../lib/larceny/compile-larceny /usr/local/bin/compile-larceny
RUN ln -s ../lib/larceny/scheme-script /usr/local/bin/scheme-script
CMD ["scheme-banner"]
