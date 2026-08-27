# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      git \
      ca-certificates \
      libgc-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/ashinn/chibi-scheme.git snow-chibi --depth 1
WORKDIR /build/snow-chibi
RUN make PREFIX=/opt/snow-chibi
RUN make PREFIX=/opt/snow-chibi install

FROM debian:trixie-slim
COPY --from=build /opt /opt
ENV PATH=/opt/snow-chibi/bin:${PATH}
ENV LD_LIBRARY_PATH=/opt/snow-chibi/lib

