# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    wget \
    xz-utils \
    build-essential \
    rustc \
    cargo \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O stak.tar.gz \
    https://github.com/raviqqe/stak/archive/refs/tags/v0.12.17.tar.gz
RUN sha256sum stak.tar.gz && sha256sum -c checksum
RUN mkdir stak && tar -C stak --strip-components 1 -xf stak.tar.gz
WORKDIR /build/stak
RUN cargo install stak --root /usr/other

FROM debian:trixie-slim
COPY --from=build /usr/other/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
