# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      git \
      ca-certificates \
      build-essential \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O chicken.tar.gz \
    https://code.call-cc.org/dev-snapshots/2026/05/12/chicken-6.0.0rc3.tar.gz
RUN tar -xf chicken.tar.gz
RUN mkdir chicken-pre && tar -C chicken-pre --strip-components 1 -xf chicken.tar.gz
WORKDIR /build/chicken-pre
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
