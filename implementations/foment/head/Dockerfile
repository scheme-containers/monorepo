# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build/foment
RUN git init \
 && git remote add origin https://github.com/leftmike/foment.git \
 && git fetch origin 5488cbd6cabbaeb066d02421ff4b3fc2c19e13ba --depth 1 --tags \
 && git reset --hard FETCH_HEAD
WORKDIR /build/foment/unix
RUN make

FROM debian:bullseye-slim
COPY --from=build /build/foment/unix/release/foment /usr/local/bin/
RUN ln -s foment /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
