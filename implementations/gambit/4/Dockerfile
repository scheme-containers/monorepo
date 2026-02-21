# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ghostscript \
      texinfo \
      ca-certificates \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O gambit.tgz https://github.com/gambit/gambit/archive/refs/tags/v4.9.7.tar.gz
RUN sha256sum gambit.tgz && sha256sum -c checksum
RUN mkdir gambit && tar -C gambit --strip-components 1 -xf gambit.tgz
WORKDIR /build/gambit
RUN ./configure --enable-single-host --enable-march=native --enable-dynamic-clib --enable-trust-c-tco --prefix=/usr/local
RUN ln -s /usr/local/bin/gsc gsc-boot
RUN make -j8 || (rm -rf boot/ gsc-boot && make)
RUN make -j8 modules
RUN make -j8 check
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
      libmbedtls21 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -sf gsi /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
