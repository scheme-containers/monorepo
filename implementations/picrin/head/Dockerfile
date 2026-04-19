# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      libedit-dev \
      perl \
      pkg-config \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/picrin-scheme/picrin.git --depth 1 --tags
WORKDIR /build/picrin
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libedit2 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
