# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y --no-install-recommends install \
      make gcc:i386 libc6-dev:i386 \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/rhizome-pi/rhizome-0.57.tar.gz rhizome.tar.gz
RUN sha256sum rhizome.tar.gz && sha256sum -c checksum
RUN mkdir rhizome && tar -C rhizome --strip-components 1 -xf rhizome.tar.gz
WORKDIR /build/rhizome
RUN cp config/unix/linux/rhiz_cnf.h include/rhiz_cnf.h \
 && cp config/unix/linux/Makefile.kappa kappa/Makefile \
 && cp config/unix/linux/Makefile.pi pi/Makefile \
 && cp config/unix/linux/Makefile.pi.compiler pi/compiler/Makefile \
 && cp config/unix/linux/config.scm pi/compiler/config.scm \
 && true
WORKDIR /build/rhizome/pi
RUN make
RUN mkdir /usr/local/lib/rhizome \
 && make install

FROM debian:bullseye-slim
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y --no-install-recommends install \
      make gcc:i386 libc6-dev:i386 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
CMD ["scheme-banner"]
