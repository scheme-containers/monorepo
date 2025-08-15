# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://gitlab.com/jobol/tr7/-/archive/v1.1.1/tr7-v1.1.1.tar.gz tr7.tar.gz
RUN sha256sum tr7.tar.gz && sha256sum -c checksum
RUN mkdir tr7 && tar -C tr7 --strip-components 1 -xf tr7.tar.gz
WORKDIR /build/tr7
RUN make tr7i
RUN install -D -t /usr/local/bin tr7i

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s tr7i /usr/local/bin/scheme-banner \
 && ln -s tr7i /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
