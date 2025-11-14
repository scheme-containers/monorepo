# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    zip \
    unzip \
    build-essential \
    wget \
    git \
    ca-certificates \
    curl \
 && rm -rf /var/lib/apt/lists/*
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && sdk install java 8.0.462-tem && sdk install ant 1.9.10"
WORKDIR /build
RUN git clone https://github.com/lambdaconservatory/scheme-release-archive.git --depth=1 && cp scheme-release-archive/sisc/sisc-1.16.6.jar sisc.jar
COPY checksum checksum
RUN sha256sum sisc.jar && sha256sum -c checksum
RUN unzip sisc.jar "sisc/*"
WORKDIR /build/sisc
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && ant"
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && ant install"

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates \
      zip \
      unzip \
      curl \
      default-jdk \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s sisc /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
