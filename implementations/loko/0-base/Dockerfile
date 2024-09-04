# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      make \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://scheme.fail/releases/loko-0.12.1.tar.gz loko.tar.gz
RUN sha256sum loko.tar.gz && sha256sum -c checksum
RUN mkdir loko && tar -C loko --strip-components 1 -xf loko.tar.gz
WORKDIR /build/loko
RUN make
RUN make install

FROM scratch
COPY --from=build /usr/local /usr/local
ENTRYPOINT ["/usr/local/bin/loko"]
