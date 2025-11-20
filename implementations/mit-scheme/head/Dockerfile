# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
      libncurses-dev \
      m4 \
      make \
      texinfo \
      ca-certificates \
      git \
      automake \
      texinfo \
      libtool \
      wget \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN if [ "$(uname --machine)" = "aarch64" ]; then wget -O prebuilt.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/12.1/mit-scheme-12.1-aarch64le.tar.gz; fi
RUN if [ "$(uname --machine)" = "x86_64" ]; then wget -O prebuilt.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/12.1/mit-scheme-12.1-x86-64.tar.gz; fi
RUN mkdir prebuilt && tar -C prebuilt --strip-components 1 -xf prebuilt.tar.gz
WORKDIR /build/prebuilt/src
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
WORKDIR /build
RUN git clone https://git.savannah.gnu.org/git/mit-scheme.git --depth=1
WORKDIR /build/mit-scheme/src
RUN autoheader=autoheader autoconf=autoconf bash Setup.sh
RUN ./configure -prefix=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s mit-scheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
