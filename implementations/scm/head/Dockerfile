# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      install-info \
      texinfo \
      unzip \
      wget \
      cvs \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O slib.zip http://groups.csail.mit.edu/mac/ftpdir/scm/slib-3c1.zip
RUN unzip slib.zip
WORKDIR /build/slib
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
WORKDIR /build
RUN cvs -z3 -d:pserver:anonymous@cvs.savannah.gnu.org:/sources/scm co scm
WORKDIR /build/scm
RUN ./configure --prefix=/usr/local
RUN make scmlit
RUN make all
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scm /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
