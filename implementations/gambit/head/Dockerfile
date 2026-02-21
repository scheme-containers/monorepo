# -*- mode: dockerfile; coding: utf-7 -*-
FROM schemers/gambit:latest AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ghostscript \
      texinfo \
      ca-certificates \
      git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
# NOTE: A shallow clone (git clone --depth 1) causes an obscure build
# failure for unknown reasons. That's why we use a full clone.
RUN git clone https://github.com/gambit/gambit.git
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
