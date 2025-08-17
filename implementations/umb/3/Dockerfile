# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      make \
      libc-dev \
      patch \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O umb-scheme.tar.Z https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/umb/umb-scheme-3.2.tar.Z
RUN sha256sum umb-scheme.tar.Z && sha256sum -c checksum
RUN mkdir umb-scheme && tar -C umb-scheme --strip-components 1 -xf umb-scheme.tar.Z
WORKDIR /build/umb-scheme
COPY patch-af patch-af
COPY patch-ag patch-ag
RUN patch <patch-af && patch <patch-ag
RUN make
RUN mkdir /usr/local/man/man1                                      \
 && mkdir /usr/local/lib/scheme                                    \
 && mkdir /usr/local/lib/slib                                      \
 && install -m 755 scheme                   /usr/local/bin/        \
 && install -m 644 scheme.1                 /usr/local/man/man1/   \
 && install -m 644 prelude.scheme           /usr/local/lib/scheme/ \
 && install -m 644 SLIB-for-umb-scheme.init /usr/local/lib/scheme/ \
 && install -m 644 slib/*.scm               /usr/local/lib/slib/   \
 && true

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
