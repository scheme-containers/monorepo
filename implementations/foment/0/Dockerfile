# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/leftmike/foment/archive/v0.4.1.tar.gz foment.tar.gz
RUN sha256sum foment.tar.gz && sha256sum -c checksum
RUN mkdir foment && tar -C foment --strip-components 1 -xf foment.tar.gz
WORKDIR /build/foment/unix
RUN make

FROM debian:bullseye-slim
COPY --from=build /root/foment/unix/release/foment /usr/local/bin/
RUN ln -s foment /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
