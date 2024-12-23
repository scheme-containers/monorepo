# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      cmake \
      ca-certificates \
      cpio \
      git \
      libcurl4-openssl-dev \
      libonig-dev \
      libffi-dev \
      libgmp-dev \
      llvm-15 \
      clang-15 \
      llvm-15-dev \
      lld-15 \
 && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --install /usr/bin/clang clang++ /usr/bin/clang-15 0
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-15 0
RUN update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-15 0
WORKDIR /build/
RUN git clone https://github.com/fujita-y/ypsilon.git --depth 1
WORKDIR /build/ypsilon
RUN CC=clang-15 CXX=clang++-15 cmake -DCMAKE_BUILD_TYPE=Release .
RUN CC=clang-15 CXX=clang++-15 cmake --build .
RUN CC=Clang-15 CXX=clang++-15 cmake --install .

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8 \
      libgmp10 \
      libllvm15 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin
RUN ln -s ypsilon /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
