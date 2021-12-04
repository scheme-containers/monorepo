# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:buster-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git libedit-dev perl pkg-config \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build/picrin
RUN git init \
 && git remote add origin https://github.com/picrin-scheme/picrin.git \
 && git fetch origin 2af9020b73ef9b6f89246ec35bed32bbe83986e3 --depth 1 --tags \
 && git reset --hard FETCH_HEAD
RUN make
RUN make install
COPY write-scheme-version write-scheme-version
RUN ./write-scheme-version | tee /usr/local/share/scheme-version

FROM debian:buster-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libedit2 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
