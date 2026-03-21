# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    make \
    wget \
    ca-certificates \
    cmake \
    libgmp-dev \
    git \
    clang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O meevax.tar.gz https://github.com/yamacir-kit/meevax/archive/refs/tags/v0.5.439.tar.gz
RUN sha256sum meevax.tar.gz && sha256sum -c checksum
RUN mkdir meevax && tar -C meevax --strip-components 1 -xf meevax.tar.gz
WORKDIR /build/meevax
RUN CC=clang CXX=clang++ cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
WORKDIR /build/meevax/build
RUN make CC=clang CXX=clang++ -j8 all
RUN make CC=clang CXX=clang++ install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ldconfig
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
CMD ["scheme-banner"]
