# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ncurses-dev \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O s9fes.tgz https://www.t3x.org/s9fes/s9fes-20181205.tgz
RUN sha256sum s9fes.tgz && sha256sum -c checksum
RUN mkdir s9fes && tar -C s9fes --strip-components 1 -xf s9fes.tgz
WORKDIR /build/s9fes
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
       libncurses6 \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s s9 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
