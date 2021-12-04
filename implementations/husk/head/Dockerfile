# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      cabal-install \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN cabal update
RUN mkdir -p /root/.cabal/bin
RUN cabal install --prefix=/usr/local husk-scheme husk-scheme-libs

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN apt-get update && apt-get -y --no-install-recommends install \
      libatomic1 \
 && rm -rf /var/lib/apt/lists/*
RUN ln -s huski /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
