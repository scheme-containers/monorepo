# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc make libc-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/minischeme/0.85k4/minischeme.tar.gz minischeme.tar.gz
RUN sha256sum minischeme.tar.gz && sha256sum -c checksum
RUN mkdir minischeme && tar -C minischeme --strip-components 1 -xf minischeme.tar.gz
WORKDIR /build/minischeme
RUN sed -i 's@"init.scm"@"/usr/local/share/miniscm/init.scm"@' miniscm.c
RUN cc -D BSD -o miniscm miniscm.c
RUN mkdir /usr/local/share/miniscm \
 && install -m 755 miniscm /usr/local/bin/ \
 && install -m 644 *.scm /usr/local/share/miniscm/

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s miniscm /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
