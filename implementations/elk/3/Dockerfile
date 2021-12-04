# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD http://sam.zoy.org/elk/elk-3.99.8.tar.gz elk.tar.gz
RUN sha256sum elk.tar.gz && sha256sum -c checksum
RUN mkdir elk && tar -C elk --strip-components 1 -xf elk.tar.gz
WORKDIR /build/elk
RUN ./configure
RUN make
RUN make install
COPY write-scheme-version write-scheme-version
RUN ./write-scheme-version | tee /usr/local/share/scheme-version

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
