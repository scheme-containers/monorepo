# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/lambdaconservatory/femtolisp.git --depth 1
WORKDIR /build/femtolisp
RUN mkdir -p /usr/local/share/flisp/
RUN cp -p flisp.boot /usr/local/share/flisp/flisp.boot
RUN make CFLAGS='-D INITFILE=\"/usr/local/share/flisp/flisp.boot\"'
RUN cp -p flisp /usr/local/bin/

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s flisp /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
