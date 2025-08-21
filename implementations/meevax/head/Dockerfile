# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
      cmake \
      libgmp-dev git \
      clang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/yamacir-kit/meevax.git --depth=1
WORKDIR /build/meevax
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
WORKDIR /build/meevax/build
RUN make all
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
