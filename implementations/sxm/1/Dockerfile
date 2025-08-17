# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O sxm.tar.gz https://malgil.com/sxm/sxm-1.1.tar.gz
RUN sha256sum sxm.tar.gz && sha256sum -c checksum
RUN mkdir sxm && tar -C sxm --strip-components 1 -xf sxm.tar.gz
WORKDIR /build/sxm
RUN make
#RUN make test  # Causes a segfault.
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s sxi /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
