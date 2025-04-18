# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/IronScheme/IronScheme/releases/download/1.0.575/IronScheme-1.0.575-91bdd4b.zip IronScheme.zip
RUN sha256sum IronScheme.zip && sha256sum -c checksum
RUN unzip -d IronScheme IronScheme.zip && mv IronScheme /usr/local

FROM mcr.microsoft.com/dotnet/runtime:9.0.4-bookworm-slim
COPY --from=build /usr/local/IronScheme /usr/local/IronScheme/
ENV LANG C.UTF-8
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
CMD ["scheme-banner"]
