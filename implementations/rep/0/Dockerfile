# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential libffi-dev libgdbm-dev libgmp-dev texinfo \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://download.tuxfamily.org/librep/librep_0.92.7.tar.xz \
  librep.tar.xz
RUN sha256sum librep.tar.xz && sha256sum -c checksum
RUN mkdir librep && tar -C librep --strip-components 1 -xf librep.tar.xz
WORKDIR /build/librep
RUN ./configure
RUN make
RUN make install

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libffi7 libgdbm6 libgmp10 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s rep /usr/local/bin/scheme-banner
RUN ldconfig
CMD ["scheme-banner"]
