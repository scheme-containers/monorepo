# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential autoconf automake libtool m4 \
      ca-certificates git libexpat1-dev libgc-dev zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/adh/dfsch.git --depth=1
WORKDIR /build/dfsch
RUN ./bootstrap.sh
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libexpat1 libgc-dev zlib1g \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s dfsch-repl /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
