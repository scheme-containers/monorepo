# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://gitlab.com/jobol/tr7/-/archive/v1.0.14/tr7-v1.0.14.tar.gz tr7.tar.gz
RUN sha256sum tr7.tar.gz && sha256sum -c checksum
RUN mkdir tr7 && tar -C tr7 --strip-components 1 -xf tr7.tar.gz
WORKDIR /build/tr7
RUN make
RUN cp tr7i /usr/local/bin/

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
