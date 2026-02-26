# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    make \
    wget \
    ca-certificates \
    cmake \
    libgmp-dev git \
    clang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/yamacir-kit/meevax.git --depth=1
WORKDIR /build/meevax
RUN CC=clang CXX=clang++ cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
WORKDIR /build/meevax/build
RUN make CC=clang CXX=clang++ -j8 all
RUN make CC=clang CXX=clang++ install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
