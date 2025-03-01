# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        msitools ca-certificates wget gpg \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O gauche.exe https://github.com/shirok/Gauche/releases/download/release0_9_15/Gauche-mingw-0.9.15-64bit.msi
RUN sha256sum gauche.exe && sha256sum -c checksum
RUN mkdir -p /root/.wine/drive_c/Program\ Files/
RUN msiextract gauche.exe && cp -r Gauche /root/.wine/drive_c/Program\ Files/Gauche

FROM debian:bookworm-slim
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates wine \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.wine /root/.wine
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Gauche/bin
COPY scheme-banner scheme-r7rs scheme-script /usr/local/bin/
CMD scheme-banner
