# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      pkg-config \
      perl \
      gdbmtool \
      autoconf \
      autoconf-archive \
      libtool \
      automake \
      autoconf \
      m4 \
      libffi-dev \
      libgdbm-dev \
      libgmp-dev \
      texinfo \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O librep.tar.gz https://github.com/SawfishWM/librep/archive/refs/tags/librep-0.92.7.tar.gz
RUN sha256sum librep.tar.gz && sha256sum -c checksum
RUN mkdir librep && tar -C librep --strip-components 1 -xf librep.tar.gz
WORKDIR /build/librep
RUN ./autogen.sh --with-value-type="long long"
RUN ./configure --with-value-type="long long" --prefix=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi8 \
      libgdbm6 \
      libgmp10 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s rep /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
