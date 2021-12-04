# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential xxd \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/yuriy-chumak/ol/archive/2.2.tar.gz ol.tar.gz
RUN sha256sum ol.tar.gz && sha256sum -c checksum
RUN mkdir ol && tar -C ol --strip-components 1 -xf ol.tar.gz
WORKDIR /build/ol
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s ol /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
