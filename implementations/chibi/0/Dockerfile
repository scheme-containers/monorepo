FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O chibi.tar.gz https://github.com/ashinn/chibi-scheme/archive/refs/tags/0.12.tar.gz
RUN sha256sum chibi.tar.gz && sha256sum -c checksum
RUN mkdir chibi && tar -C chibi --strip-components 1 -xf chibi.tar.gz
WORKDIR /build/chibi
RUN make
RUN make test-dist
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
RUN ldconfig
CMD ["scheme-banner"]
