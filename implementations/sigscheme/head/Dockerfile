# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    file \
    git \
    ca-certificates \
    asciidoc \
    autoconf \
    autoconf-archive \
    bzip2 \
    gcc \
    libc6-dev \
    libtool \
    make \
    pkg-config \
    ruby \
    tzdata \
    automake \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/uim/sigscheme.git --recursive --depth=1
WORKDIR /build/sigscheme
RUN ./autogen.sh
RUN ./configure --enable-maintainer-mode --prefix=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
