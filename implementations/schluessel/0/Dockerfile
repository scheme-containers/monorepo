# -*- mode: dockerfile; coding: utf-8 -*-
# We take the easy way out and just copy the JAR file. TODO: Build from source.
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O schluessel.tar.gz https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/schluessel/schluessel-0.4.4-bin.tar.gz
RUN sha256sum schluessel.tar.gz && sha256sum -c checksum
RUN mkdir schluessel && tar -C schluessel --strip-components 1 -xf schluessel.tar.gz
WORKDIR /build/schluessel
RUN mkdir /usr/local/share/schluessel
RUN cp schluessel.jar /usr/local/share/schluessel/

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      default-jre-headless \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
