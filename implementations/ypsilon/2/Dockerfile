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
      libgmp10 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY --from=build /usr/lib/x86_64-linux-gnu/libLLVM-11.so.1 /usr/local/lib/
COPY --from=build /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/local/lib/
COPY --from=build /usr/lib/x86_64-linux-gnu/libedit.so.2 /usr/local/lib/
COPY --from=build /usr/lib/x86_64-linux-gnu/libz3.so.4 /usr/local/lib/
COPY scheme-script /usr/local/bin
RUN ln -s ypsilon /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]