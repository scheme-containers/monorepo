# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    cpio \
    git \
    libffi-dev \
    libgmp-dev \
    llvm-19 \
    llvm-19-dev \
    clang-19 \
    llvm-19-dev \
    lld-19 \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build/
RUN git clone https://github.com/fujita-y/ypsilon.git --depth 1

RUN update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-19 50
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-19 50
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-19 50

WORKDIR /build/ypsilon
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN cmake --build .
RUN cmake --install .

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libgmp10 llvm-19-runtime\
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin
RUN ln -s ypsilon /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
