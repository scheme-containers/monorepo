# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://people.delphiforums.com/gjc/siod.tgz siod.tgz
RUN sha256sum siod.tgz && sha256sum -c checksum
RUN mkdir siod
WORKDIR /build/siod
RUN tar -xf ../siod.tgz
RUN make linux
RUN make install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s siod /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
