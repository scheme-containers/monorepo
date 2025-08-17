# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      git \
      ca-certificates \
      build-essential \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget https://code.call-cc.org/dev-snapshots/2024/12/09/chicken-6.0.0pre1.tar.gz
RUN tar -xf chicken-6.0.0pre1.tar.gz
WORKDIR /build/chicken-6.0.0pre1
RUN ./configure --prefix=/usr/local-other && make && make install
WORKDIR /build
RUN git clone https://code.call-cc.org/git/chicken-core.git chicken
WORKDIR /build/chicken
RUN ./configure --prefix=/usr/local
RUN make CHICKEN=/usr/local-other/bin/chicken
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
CMD ["scheme-banner"]
