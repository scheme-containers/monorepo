# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      curl \
      unzip \
      zip \
      wget \
      git \
      automake \
      autoconf \
      texinfo \
      openjdk-25-jdk \
      libreadline-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/kashell/Kawa.git kawa --depth 1
WORKDIR kawa
RUN ./autogen.sh
RUN ./configure --enable-kawa-frontend
RUN make
RUN make install

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
