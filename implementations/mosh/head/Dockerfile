# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/mosh AS build
# We install Gauche like this as compromise
RUN apt-get update && apt-get -y --no-install-recommends install \
      wget \
      autoconf \
      automake \
      libtool \
      bison \
      build-essential \
      ca-certificates \
      cpio \
      git \
      libffi-dev \
      libgmp-dev \
      libonig-dev \
      libssl-dev \
      pkg-config \
      re2c \
      gzip \
      texinfo \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/shirok/Gauche/releases/download/release0_9_15/Gauche-0.9.15.tgz && tar -xf Gauche-0.9.15.tgz
RUN cd Gauche-0.9.15 && ./configure && make && make install
WORKDIR /build
RUN git clone https://github.com/higepon/mosh.git --depth=1
WORKDIR /build/mosh
RUN ./gen-git-build.sh
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libssl3 \
      libffi8 \
      libgmp10 \
      libonig5 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
CMD ["scheme-banner"]
