# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      libffi-dev \
      libgc-dev \
      libgmp-dev \
      libltdl-dev \
      libncurses-dev \
      libreadline-dev \
      libtinfo-dev \
      libunistring-dev \
      pkg-config \
      xz-utils \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://ftp.gnu.org/gnu/guile/guile-2.2.7.tar.xz guile.tar.xz
RUN sha256sum guile.tar.xz && sha256sum -c checksum
RUN mkdir guile && tar -C guile --strip-components 1 -xf guile.tar.xz
WORKDIR /build/guile
RUN ./configure
RUN make
RUN make check
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi7 \
      libgc1 \
      libgmp10 \
      libltdl7 \
      libncurses6 \
      libreadline8 \
      libtinfo6 \
      libunistring2 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin/
RUN ln -s /usr/local/bin/guile /usr/local/bin/scheme-banner
RUN ldconfig || true
CMD ["scheme-banner"]
