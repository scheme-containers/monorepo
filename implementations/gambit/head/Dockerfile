# -*- mode: dockerfile; coding: utf-8 -*-

# NOTE: A shallow clone (git clone --depth 1) causes an obscure build
# failure for unknown reasons. That's why we use a full clone.

FROM schemers/gambit:latest AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ghostscript \
      texinfo \
      ca-certificates \
      git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/gambit/gambit.git
WORKDIR /build/gambit
RUN ./configure --prefix=/usr/local --enable-single-host
RUN ln -s /usr/local/bin/gsc gsc-boot
RUN make -j4 || (rm -rf boot/ gsc-boot && make)
RUN make -j4 modules
RUN make -j4 check
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
      libmbedtls21 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
CMD ["scheme-banner"]
