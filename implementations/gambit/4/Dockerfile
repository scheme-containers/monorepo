# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ghostscript texinfo \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://gambitscheme.org/latest/gambit-v4_9_7.tgz gambit.tgz
RUN sha256sum gambit.tgz && sha256sum -c checksum
RUN mkdir gambit && tar -C gambit --strip-components 1 -xf gambit.tgz
WORKDIR /build/gambit
RUN ./configure --prefix=/usr/local --enable-single-host
RUN make
RUN make check
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc libc-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s gsi /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
