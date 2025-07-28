# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential wget ca-certificates cmake libgmp-dev git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O meevax.tar.gz https://github.com/yamacir-kit/meevax/archive/refs/tags/v0.5.402.tar.gz
RUN sha256sum meevax.tar.gz && sha256sum -c checksum
RUN mkdir meevax && tar -C meevax --strip-components 1 -xf meevax.tar.gz
WORKDIR /build/meevax
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
WORKDIR /build/meevax/build
RUN make
RUN make install

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
