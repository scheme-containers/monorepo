# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      pkg-config \
      perl \
      gdbmtool \
      autoconf \
      autoconf-archive \
      libreadline-dev \
      libtool \
      automake \
      autoconf \
      m4 \
      libffi-dev \
      libgdbm-dev \
      libgmp-dev \
      texinfo \
      git \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/SawfishWM/librep.git --depth=1
WORKDIR /build/librep
RUN ./autogen.sh --with-value-type="long long"
RUN autoupdate
RUN ./configure --with-value-type="long long" --prefix=/usr/local
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    libreadline-dev \
    libffi-dev \
    libgdbm-dev \
    libgmp-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s rep /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
