# -*- mode: dockerfile; coding: utf-8 -*-

# NB: There is an official Gerbil Dockerfile at
# <https://github.com/vyzo/gerbil/blob/master/Dockerfile>

FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      libsqlite3-dev \
      libssl-dev \
      openssl \
      sqlite3 \
      zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://www.iro.umontreal.ca/~gambit/download/gambit/v4.9/source/gambit-v4_9_3.tgz gambit.tgz
ADD https://github.com/vyzo/gerbil/archive/v0.16.tar.gz gerbil.tar.gz
RUN sha256sum gambit.tgz gerbil.tar.gz && sha256sum -c checksum
RUN mkdir gambit && tar -C gambit --strip-components 1 -xf gambit.tgz
RUN mkdir gerbil && tar -C gerbil --strip-components 1 -xf gerbil.tar.gz
WORKDIR /build/gambit
RUN ./configure --prefix=/usr/local --enable-single-host
RUN make
RUN make install
WORKDIR /build/gerbil/src
RUN ./build.sh

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates gcc git libc-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY --from=build /build/gerbil/bin/ /usr/local/bin/
COPY --from=build /build/gerbil/lib/ /usr/local/lib/
ENV GERBIL_HOME=/usr/local
RUN ln -s gxi /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
