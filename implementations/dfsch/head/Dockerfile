# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:buster-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential autoconf automake libtool m4 \
      ca-certificates git libexpat1-dev libgc-dev zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build/dfsch
RUN git init \
 && git remote add origin https://github.com/adh/dfsch.git \
 && git fetch origin 0b54da0f392485754d587e3f678219ad07991733 --depth 1 --tags \
 && git reset --hard FETCH_HEAD
RUN ./bootstrap.sh
RUN ./configure
RUN make
RUN make install

FROM debian:buster-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libexpat1 libgc1c2 zlib1g \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s dfsch-repl /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]

# The release doesn't contain a pre-generated "configure" script, and
# I couldn't get the current autotools generators to work.
#
# COPY checksum checksum
# ADD https://github.com/adh/dfsch/archive/rel-0.4.0.tar.gz dfsch.tar.gz
# RUN sha256sum dfsch.tar.gz && sha256sum -c checksum
# RUN mkdir dfsch && tar -C dfsch --strip-components 1 -xf dfsch.tar.gz
# WORKDIR /build/dfsch
