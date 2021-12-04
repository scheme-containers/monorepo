# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      git \
      file \
      libtool \
      autoconf \
      automake \
      libncurses5-dev \
      libreadline-dev \
      libltdl-dev \
      libgmp-dev \
      texinfo \
      flex \
      libunistring-dev \
      libgc-dev \
      libffi-dev \
      pkg-config \
      gettext \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY checksum checksum
ADD https://ftp.gnu.org/gnu/guile/guile-3.0.4.tar.gz guile.tar.gz
RUN sha256sum guile.tar.gz && sha256sum -c checksum
RUN mkdir guile && tar -C guile --strip-components 1 -xzf guile.tar.gz
WORKDIR guile
RUN ./configure
RUN make -j`nproc`
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libgc1 \
      libltdl7
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin/
RUN ln -s /usr/local/bin/guile /usr/local/bin/scheme-banner
RUN ldconfig || true
CMD ["scheme-banner"]
