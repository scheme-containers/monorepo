# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates git \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/lambdaconservatory/xscheme.git --depth 1
WORKDIR /build/xscheme
RUN make
RUN cp xscheme /usr/local/bin/xscheme

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s xscheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
