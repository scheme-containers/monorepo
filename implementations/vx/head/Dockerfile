# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential git ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/lambdaconservatory/vx-scheme.git vx
WORKDIR /build/vx/src
RUN echo "VX-Scheme $(git describe --always --dirty --tags)" \
      >/usr/local/share/vx-scheme-version
RUN { echo "#include <limits>" && cat vx-scheme.h; } >vx-scheme.h.new \
 && mv vx-scheme.h.new vx-scheme.h
RUN make
RUN install -m 755 vx-scheme /usr/local/bin/

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
CMD ["scheme-banner"]
