# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
       ca-certificates \
       gcc \
       libtool \
       m4 \
       texinfo \
       autoconf \
       automake \
       libc6-dev \
       libffi-dev \
       libgmp-dev \
       libreadline-dev \
       file \
       make \
       wget \
       git \
       xz-utils \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O vs.tar.xz https://github.com/marcomaggi/vicare/archive/refs/tags/v0.4.1-devel.3.tar.gz
RUN mkdir vs && tar -C vs --strip-components 1 -xaf vs.tar.xz
WORKDIR /build/vs
RUN sh autogen.sh
RUN VERSION=v0.4.1-devel3 ./configure \
	--prefix=/usr/local \
	--disable-posix \
	--disable-glibc \
	--disable-linux \
	--enable-maintainer-mode
RUN make CFLAGS=-std=gnu99
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libffi8 \
       libgmp10 \
       libreadline8 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/vicare/ /usr/local/vicare/
COPY scheme-script /usr/local/bin/
RUN ln -s ../vicare/bin/vicare /usr/local/bin/vicare
RUN ln -s vicare /usr/local/bin/scheme-banner
CMD ["scheme-banner"]