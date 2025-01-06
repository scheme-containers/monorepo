# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      file \
      libtool \
      autoconf \
      automake \
      autopoint \
      gperf \
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
RUN git clone https://git.savannah.gnu.org/git/guile.git guile --depth=1
WORKDIR /build/guile
RUN ./autogen.sh
RUN ./configure
RUN make -j$(nproc)
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libgc1 \
      libltdl7
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
RUN ln -s /usr/local/bin/guile /usr/local/bin/scheme-banner
RUN ldconfig || true
CMD ["scheme-banner"]
