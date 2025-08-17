# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      install-info \
      texinfo \
      unzip \
      wget \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O scm.zip http://groups.csail.mit.edu/mac/ftpdir/scm/scm-5f4.zip
RUN wget -O slib.zip http://groups.csail.mit.edu/mac/ftpdir/scm/slib-3c1.zip
RUN sha256sum scm.zip slib.zip && sha256sum -c checksum
RUN unzip scm.zip
RUN unzip slib.zip
WORKDIR /build/slib
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
WORKDIR /build/scm
RUN ./configure --prefix=/usr/local
RUN make scmlit
RUN make all
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scm /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
