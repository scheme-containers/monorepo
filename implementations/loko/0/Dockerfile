# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      make \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://scheme.fail/releases/loko-0.12.2.tar.gz loko.tar.gz
RUN sha256sum loko.tar.gz && sha256sum -c checksum
RUN mkdir loko && tar -C loko --strip-components 1 -xf loko.tar.gz
WORKDIR /build/loko
RUN make
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local /usr/local
RUN ln -s loko /usr/local/bin/scheme-banner \
 && ln -s loko /usr/local/bin/scheme-script
CMD ["scheme-banner"]
