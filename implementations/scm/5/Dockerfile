# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential install-info texinfo unzip \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD http://groups.csail.mit.edu/mac/ftpdir/scm/scm-5f4.zip scm.zip
ADD http://groups.csail.mit.edu/mac/ftpdir/scm/slib-3c1.zip slib.zip
RUN sha256sum scm.zip slib.zip && sha256sum -c checksum
RUN unzip scm.zip
RUN unzip slib.zip
WORKDIR /build/slib
RUN ./configure
RUN make
RUN make install
WORKDIR /build/scm
RUN ./configure
RUN make scmlit
RUN make all
RUN make install

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scm /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
