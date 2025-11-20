# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
#FROM debian:buster AS build
#RUN echo "deb http://archive.debian.org/debian/ buster contrib main" > /etc/apt/sources.list
#RUN echo "deb http://archive.debian.org/debian/ buster-updates contrib main" >> /etc/apt/sources.list
#RUN echo "deb http://archive.debian.org/debian/ buster-backports contrib main" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    libc-dev \
    libncurses-dev \
    build-essential \
    gcc \
    libtool \
    m4 \
    texinfo \
    autoconf \
    automake \
    libreadline-dev \
    libffi-dev \
    libgmp-dev \
    file \
    make \
    wget \
    git \
    xz-utils \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/marcomaggi/vicare.git --depth=1
RUN mkdir vicare && tar -C vicare --strip-components 1 -xaf vicare.tar.xz
WORKDIR /build/vicare
RUN bash autogen.sh
RUN ./configure
RUN VERSION=head ./configure --prefix=/usr/local --enable-maintainer-mode
RUN make
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
