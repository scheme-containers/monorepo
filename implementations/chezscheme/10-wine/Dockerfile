# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    ca-certificates wget gpg cabextract msitools \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O chez.exe https://github.com/cisco/ChezScheme/releases/download/v10.1.0/ChezScheme10.1.0.exe
RUN sha256sum chez.exe && sha256sum -c checksum
RUN mkdir /root/.wine
RUN cabextract chez.exe
RUN msiextract a0 a1
RUN mkdir -p /root/.wine/drive_c/Program\ Files/Chez
RUN cp -r Program\ Files/Chez\ Scheme\ 10.1.0/* /root/.wine/drive_c/Program\ Files/Chez/
RUN cp -r Chez\ Scheme\ 10.1.0/* /root/.wine/drive_c/Program\ Files/Chez/

FROM debian:trixie-slim
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    ca-certificates wine \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.wine /root/.wine
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Chez/bin/ta6nt
COPY scheme scheme-banner /usr/local/bin/
CMD scheme-banner
