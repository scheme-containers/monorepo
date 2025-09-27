# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    cpio \
    git \
    libffi-dev \
    libgmp-dev \
    llvm \
    clang \
    llvm-dev \
    lld \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build/
RUN git clone https://github.com/fujita-y/ypsilon.git --depth 1

WORKDIR /build/ypsilon
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN cmake --build .
RUN cmake --install .

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8 \
      libgmp10 \
      libllvm19 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin
RUN ln -s ypsilon /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
