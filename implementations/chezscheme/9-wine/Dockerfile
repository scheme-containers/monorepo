# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates wget gpg cabextract msitools
WORKDIR /build
COPY checksum checksum
RUN wget -O chez.exe https://github.com/cisco/ChezScheme/releases/download/v9.6.4/ChezScheme9.6.4.exe
RUN sha256sum chez.exe && sha256sum -c checksum
RUN mkdir /root/.wine
RUN cabextract chez.exe
RUN msiextract a0 a1
RUN mkdir -p /root/.wine/drive_c/Program\ Files/Chez
RUN cp -r Program\ Files/Chez\ Scheme\ 9.6.4/* /root/.wine/drive_c/Program\ Files/Chez/
RUN cp -r Chez\ Scheme\ 9.6.4/* /root/.wine/drive_c/Program\ Files/Chez/

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates wine \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.wine /root/.wine
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Chez/bin/ta6nt
COPY scheme-banner /usr/local/bin/
CMD scheme-banner
