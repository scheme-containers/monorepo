# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD http://www.s48.org/1.9.2/scheme48-1.9.2.tgz scheme48.tgz
RUN sha256sum scheme48.tgz && sha256sum -c checksum
RUN mkdir scheme48 && tar -C scheme48 --strip-components 1 -xf scheme48.tgz
WORKDIR /build/scheme48
RUN ./configure
RUN make
#RUN make test  # Works, but takes quite a while.
RUN make install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scheme48 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
