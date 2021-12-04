# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc make libc-dev patch \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/sizzle/sizzle-0.0.31.tar.gz sizzle.tar.gz
RUN sha256sum sizzle.tar.gz && sha256sum -c checksum
RUN mkdir sizzle && tar -C sizzle --strip-components 1 -xf sizzle.tar.gz
WORKDIR /build/sizzle
COPY lvalue.patch lvalue.patch
RUN patch -p 1 <lvalue.patch
RUN ./configure
RUN make
RUN make install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
CMD ["scheme-banner"]
