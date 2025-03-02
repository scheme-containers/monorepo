# -*- mode: dockerfile; coding: utf-8 -*-
FROM alpine:edge AS build
RUN apk add innoextract wine wget
WORKDIR /build
COPY checksum checksum
RUN wget -O sagittarius.exe https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/setup_sagittarius_0.9.11_x64.exe
RUN sha256sum sagittarius.exe && sha256sum -c checksum
RUN mkdir -p /root/.wine/drive_c/Program\ Files/
RUN innoextract sagittarius.exe && cp -r app /root/.wine/drive_c/Program\ Files/Sagittarius

FROM alpine:edge
RUN apk add wine
COPY --from=build /root/.wine /root/.wine
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Sagittarius
ENV DISPLAY=
COPY sash scheme-banner scheme-r7rs scheme-script /usr/local/bin/
CMD scheme-banner
