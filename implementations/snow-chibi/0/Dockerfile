FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
      libgc-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O snow-chibi.tar.gz https://github.com/ashinn/chibi-scheme/archive/refs/tags/0.12.tar.gz
RUN sha256sum snow-chibi.tar.gz && sha256sum -c checksum
RUN mkdir snow-chibi && tar -C snow-chibi --strip-components 1 -xf snow-chibi.tar.gz
WORKDIR /build/snow-chibi
RUN make PREFIX=/opt/snow-chibi
RUN make PREFIX=/opt/snow-chibi install

FROM debian:trixie-slim
COPY --from=build /opt /opt
ENV PATH=/opt/snow-chibi/bin:${PATH}
ENV LD_LIBRARY_PATH=/opt/snow-chibi/lib
