# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      libffi-dev \
      libgmp-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build/ikarus
RUN git init \
 && git remote add origin https://github.com/lambdaconservatory/ikarus.git \
 && git fetch origin 1f2b250ed9e8cb1c2466c939a9a305461db71739 --depth 1 --tags \
 && git reset --hard FETCH_HEAD
RUN ./configure
RUN make
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi7 \
      libgmp10 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s ikarus /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
