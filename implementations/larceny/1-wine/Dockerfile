# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates wget gpg \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O larceny.tar.gz https://larcenists.org/LarcenyReleases/larceny-1.3-bin-native-ia32-win32.tar.gz
RUN sha256sum larceny.tar.gz && sha256sum -c checksum
RUN mkdir larceny && tar -C larceny --strip-components 1 -xf larceny.tar.gz
RUN mkdir -p /root/.wine/drive_c/Program\ Files/ \
    && mv larceny /root/.wine/drive_c/Program\ Files/Larceny

FROM debian:bookworm-slim
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates wget gpg wine wine32:i386 \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.wine /root/.wine
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Larceny
ENV DISPLAY=
COPY scheme-banner scheme-r7rs scheme-script /usr/local/bin/
CMD scheme-banner
