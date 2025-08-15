# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip \
      build-essential \
      wget \
      git \
      ant \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
RUN cd /opt && wget -O jdk.tar.gz https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u462-b08/openlogic-openjdk-8u462-b08-linux-x64.tar.gz && tar -xf jdk.tar.gz && mv openlogic-openjdk-8u462-b08-linux-x64 jdk8
ENV PATH=/opt/jdk8/bin:${PATH}
ENV JAVA_HOME=/opt/jdk8
WORKDIR /build
RUN git clone https://github.com/lambdaconservatory/scheme-release-archive.git --depth=1 && cp scheme-release-archive/sisc/sisc-1.16.6.jar sisc.jar
COPY checksum checksum
RUN sha256sum sisc.jar && sha256sum -c checksum
RUN unzip sisc.jar "sisc/*"
WORKDIR /build/sisc
RUN ant
RUN ant install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN cd /opt && wget -O jdk.tar.gz https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u462-b08/openlogic-openjdk-8u462-b08-linux-x64.tar.gz && tar -xf jdk.tar.gz && mv openlogic-openjdk-8u462-b08-linux-x64 jdk8
ENV PATH=/opt/jdk8/bin:${PATH}
ENV JAVA_HOME=/opt/jdk8
RUN ln -s sisc /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
