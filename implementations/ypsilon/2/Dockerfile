# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      wget \
      ca-certificates \
      git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN wget -O llvm.tar.xz https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.5/clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04.tar.xz
RUN apt-get update && apt-get install -y xz-utils
RUN mkdir llvm && tar -C llvm --strip-components 1 -xf llvm.tar.xz
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      make \
      cmake \
      ca-certificates \
      cpio \
      libcurl4-openssl-dev \
      libonig-dev \
      libffi-dev \
      libgmp-dev \
 && rm -rf /var/lib/apt/lists/*

ENV PATH=/opt/llvm/bin:${PATH}
RUN cp -r /opt/llvm/lib/* /usr/lib/
RUN cp -r /opt/llvm/include/* /usr/include/

WORKDIR /build/
RUN git clone https://github.com/fujita-y/ypsilon.git --depth 1
WORKDIR /build/ypsilon
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN cmake --build .
RUN cmake --install .

FROM debian:trixie-slim
#COPY --from=build /opt/llvm/lib/* /usr/lib/
COPY --from=build /usr/local/ /usr/local/
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8 \
      libgmp10 \
 && rm -rf /var/lib/apt/lists/*
COPY scheme-script /usr/local/bin
RUN ln -s ypsilon /usr/local/bin/scheme-banner
CMD ["scheme-banner"]