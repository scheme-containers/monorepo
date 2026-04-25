# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      xxd \
      wget \
      git \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/yuriy-chumak/ol.git --depth=1
WORKDIR /build/ol
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s ol /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
