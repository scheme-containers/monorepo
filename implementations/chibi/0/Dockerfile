# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://synthcode.com/scheme/chibi/chibi-scheme-0.10.0.tgz chibi.tgz
RUN sha256sum chibi.tgz && sha256sum -c checksum
RUN mkdir chibi && tar -C chibi --strip-components 1 -xf chibi.tgz
WORKDIR /build/chibi
RUN make
#RUN make test-dist
RUN make install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
