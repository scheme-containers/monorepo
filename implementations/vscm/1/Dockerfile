# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O vscm.tar.gz https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/vscm/vscmV1R2.tar.gz
RUN sha256sum vscm.tar.gz && sha256sum -c checksum
RUN mkdir vscm && tar -C vscm --strip-components 1 -xf vscm.tar.gz
WORKDIR /build/vscm
RUN sed -i "s,/home/blume,/usr/local/lib/vscm,g" Makefile
RUN make
RUN mkdir /usr/local/lib/vscm \
 && mkdir /usr/local/lib/vscm/lib \
 && install -m 644 .scheme-boot /usr/local/lib/vscm/lib/ \
 && install -m 755 scheme /usr/local/bin/

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
CMD ["scheme-banner"]
