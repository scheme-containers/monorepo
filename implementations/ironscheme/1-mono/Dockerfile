# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/IronScheme/IronScheme/releases/download/1.0.266/IronScheme-1.0.266-a52b5aa.zip IronScheme.zip
RUN sha256sum IronScheme.zip && sha256sum -c checksum
RUN unzip IronScheme.zip && mv IronScheme /usr/local

FROM debian:bullseye-slim
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
