# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential git ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
#ADD https://github.com/leftmike/foment/archive/v0.4.1.tar.gz foment.tar.gz
#RUN sha256sum foment.tar.gz && sha256sum -c checksum
#RUN mkdir foment && tar -C foment --strip-components 1 -xf foment.tar.gz
# Use the git head as the latest release is not in good shape but head is
RUN git clone https://github.com/leftmike/foment.git
WORKDIR /build/foment/unix
RUN make

FROM debian:bookworm-slim
COPY --from=build /build/foment/unix/release/foment /usr/local/bin/
RUN ln -s foment /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
