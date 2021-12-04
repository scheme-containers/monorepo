# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential file libgc-dev libgmp-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://sourceforge.net/projects/ksi/files/ksi/ksi-3.9.0/ksi-3.9.0.tar.gz/download \
  ksi.tar.gz
RUN sha256sum ksi.tar.gz && sha256sum -c checksum
RUN mkdir ksi && tar -C ksi --strip-components 1 -xf ksi.tar.gz
WORKDIR /build/ksi
RUN ./configure
RUN make
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libgc1 libgmp10 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
