# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      mingw-w64 \
      rsync \
      bison \
      flex \
      git \
      emscripten \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/rnvannatta/vanity-scheme.git vanity --depth 1
WORKDIR /build/vanity
RUN ./configure --prefix=/usr/local
RUN make hatch
RUN make all -j
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
#COPY scheme-banner /usr/local/bin/
#CMD ["scheme-banner"]
