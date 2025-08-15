# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/leftmike/foment.git --depth=1
WORKDIR /build/foment/unix
RUN make

FROM debian:trixie-slim
COPY --from=build /build/foment/unix/release/foment /usr/local/bin/
RUN ln -s foment /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
