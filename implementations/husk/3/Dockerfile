# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      cabal-install git ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/justinethier/husk-scheme.git
WORKDIR /build/husk-scheme
RUN cabal update
RUN cabal build
RUN cabal install

FROM debian:bookworm-slim
COPY --from=build /root/.cabal /root/.cabal
ENV PATH=/root/.cabal/bin:${PATH}
RUN ln -s /root/.cabal/bin/huski /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
