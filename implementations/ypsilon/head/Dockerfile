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
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build/
RUN git clone https://github.com/fujita-y/ypsilon.git --depth 1
WORKDIR /build/ypsilon
RUN make
RUN make check
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi7 \
      libgmp10 \
      libllvm11 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin
RUN ln -s ypsilon /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
