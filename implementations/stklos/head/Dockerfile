# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      autoconf \
      automake \
      file \
      texinfo \
      git \
      ca-certificates \
      libffi-dev \
      libgc-dev \
      libgmp-dev \
      bash-completion \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/egallesio/STklos.git stklos --depth 1 --tags
WORKDIR /build/stklos
RUN autoreconf
RUN ./configure --without-provided-bignum --without-provided-gc --prefix=/usr/local
RUN make
RUN make install
RUN make tests

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8 \
      libgc1 \
      libgmp10 \
      libpcre2-8-0 \
      libreadline8 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
