# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:buster-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential scons \
      libgc-dev libglib2.0-dev libncurses-dev libreadline-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://sourceforge.net/projects/schemik/files/schemik/1.2.40.0/schemik-1.2.40.0.tar.gz/download schemik.tar.gz
RUN sha256sum schemik.tar.gz && sha256sum -c checksum
RUN mkdir schemik && tar -C schemik --strip-components 1 -xf schemik.tar.gz
WORKDIR /build/schemik
RUN scons
RUN scons install prefix=/usr/local
COPY write-scheme-version write-scheme-version
RUN ./write-scheme-version | tee /usr/local/share/scheme-version

FROM debian:buster-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libgc1c2 libglib2.0 libncurses6 libreadline7 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
