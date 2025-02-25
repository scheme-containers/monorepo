# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build

RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip build-essential wget ca-certificates ant \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u442-b06/openlogic-openjdk-8u442-b06-linux-x64.tar.gz && tar -xf openlogic-*.tar.gz
ENV PATH=${PWD}/openlogic-openjdk-8u442-b06-linux-x64/bin:${PATH}
WORKDIR /build
COPY checksum checksum
RUN wget http://prdownloads.sourceforge.net/sisc/sisc-1.16.6.jar && mv sisc-1.16.6.jar sisc.jar
RUN sha256sum sisc.jar && sha256sum -c checksum
RUN jar -xfv sisc.jar
WORKDIR /build/sisc
RUN ant all
RUN ant install

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
ADD https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u442-b06/openlogic-openjdk-8u442-b06-linux-x64.tar.gz openlogic-openjdk-8.tar.gz
RUN tar -xf openlogic-openjdk-8.tar.gz
ENV PATH=${PWD}/openlogic-openjdk-8u442-b06-linux-x64/bin:${PATH}
RUN ln -s sisc /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
