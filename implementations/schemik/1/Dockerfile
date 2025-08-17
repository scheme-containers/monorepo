# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
        build-essential \
        scons \
        libc-dev \
        libgc-dev \
        libglib2.0-dev \
        libncurses-dev \
        libreadline-dev \
        wget \
        ca-certificates \
        && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O schemik.tar.gz https://sourceforge.net/projects/schemik/files/schemik/1.2.40.0/schemik-1.2.40.0.tar.gz/download
RUN sha256sum schemik.tar.gz && sha256sum -c checksum
RUN mkdir schemik && tar -C schemik --strip-components 1 -xf schemik.tar.gz
WORKDIR /build/schemik
RUN make
RUN find . -name "base.scm"
RUN cp schemik /usr/local/bin/
RUN mkdir -p /usr/local/lib/schemik
RUN cp -r scm /usr/local/lib/schemik/
COPY write-scheme-version write-scheme-version
RUN ./write-scheme-version | tee /usr/local/share/scheme-version

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libgc1 \
      libglib2.0 \
      libncurses6 \
      libreadline8t64 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
ENV SCHEMIK_HOME=/usr/local/lib/schemik
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
