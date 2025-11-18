# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      curl \
      unzip \
      zip \
      wget \
      curl \
      libreadline-dev \
 && rm -rf /var/lib/apt/lists/*
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && sdk install java 11.0.28-tem"
WORKDIR /build
COPY checksum checksum
RUN wget -O kawa.tar.gz https://ftp.gnu.org/pub/gnu/kawa/kawa-3.1.1.tar.gz
RUN sha256sum kawa.tar.gz && sha256sum -c checksum
RUN mkdir kawa && tar -C kawa --strip-components 1 -xf kawa.tar.gz
WORKDIR /build/kawa
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && ./configure --enable-kawa-frontend"
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && make"
RUN bash -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && make install"

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates \
    openjdk-25-jdk \
    libreadline-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin
COPY scheme-r7rs /usr/local/bin
CMD ["scheme-banner"]
