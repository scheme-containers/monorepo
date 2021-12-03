# -*- mode: dockerfile; coding: utf-8 -*-

# NOTE: A shallow clone (git clone --depth 1) causes an obscure build
# failure for unknown reasons. That's why we use a full clone.

FROM schemers/gambit AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ghostscript texinfo ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/gambit/gambit.git
WORKDIR /build/gambit
RUN ./configure --prefix=/usr/local \
      --enable-single-host \
      --enable-targets=js \
      --enable-default-compile-options="(compactness 9)"
RUN ln -s /usr/local/bin/gsc gsc-boot
RUN make || (rm -rf boot/ gsc-boot && make)
RUN make modules
RUN make check
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc libc-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
CMD ["scheme-banner"]
