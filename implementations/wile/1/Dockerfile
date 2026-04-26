FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    golang \
    make \
    wget \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O wile.tar.gz https://github.com/aalpar/wile/archive/refs/tags/v1.14.258.tar.gz
RUN sha256sum wile.tar.gz && sha256sum -c checksum
RUN mkdir wile && tar -C wile --strip-components 1 -xf wile.tar.gz
WORKDIR /build/wile
RUN make build
RUN install ./dist/*/*/wile /usr/local/bin/wile

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -sf /usr/local/bin/wile /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
