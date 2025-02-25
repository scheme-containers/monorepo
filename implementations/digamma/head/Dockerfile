# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates git \
      cpio make \
      llvm-11 llvm-11-dev lld-11 clang-11 \
 && rm -rf /var/lib/apt/lists/* \
 && update-alternatives --install \
      /usr/bin/llvm-config llvm-config \
      /usr/bin/llvm-config-11 11 \
 && update-alternatives --install \
      /usr/bin/lld lld \
      /usr/bin/lld-11 11 \
 && update-alternatives --install \
      /usr/bin/clang++ clang++ \
      /usr/bin/clang++-11 11 \
 && true
WORKDIR /build
RUN git clone https://github.com/fujita-y/digamma.git --depth 1
WORKDIR /build/digamma
RUN make
RUN make check
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      llvm-11 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin
RUN ln -s digamma /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
