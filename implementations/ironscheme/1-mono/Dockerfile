# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O IronScheme.zip https://github.com/IronScheme/IronScheme/releases/download/1.0.575/IronScheme-1.0.575-91bdd4b.zip
RUN sha256sum IronScheme.zip && sha256sum -c checksum
RUN unzip -d IronScheme IronScheme.zip && mv IronScheme /usr/local

FROM debian:bookworm-slim
COPY --from=build /usr/local/IronScheme /usr/local/IronScheme/
RUN apt-get update && apt-get -y --no-install-recommends install \
       mono-devel \
       mono-runtime \
  && rm -rf /var/lib/apt/lists/*
ENV LANG C.UTF-8
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
CMD ["scheme-banner"]
