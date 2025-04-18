# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates curl unzip zip wget
RUN wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/11.0.26+4/openlogic-openjdk-11.0.26+4-linux-x64-deb.deb
RUN apt-get install -y ./*.deb
WORKDIR /build
COPY checksum checksum
ADD https://ftp.gnu.org/pub/gnu/kawa/kawa-3.1.1.tar.gz kawa.tar.gz
RUN sha256sum kawa.tar.gz && sha256sum -c checksum
RUN mkdir kawa && tar -C kawa --strip-components 1 -xf kawa.tar.gz
WORKDIR kawa
RUN ./configure
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install wget ca-certificates
RUN wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/22.0.2+9/openlogic-openjdk-22.0.2+9-linux-x64-deb.deb
RUN apt-get install -y ./*.deb
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin
COPY scheme-r7rs /usr/local/bin
CMD ["scheme-banner"]
