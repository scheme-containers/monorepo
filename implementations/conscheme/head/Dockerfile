# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git golang \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/weinholt/conscheme.git
WORKDIR conscheme
RUN go get -d -v ./...
RUN go build -v ./...
RUN go test -v ./...
RUN ./rebuild.sh
RUN ./conscheme tests.scm
RUN mkdir /usr/local/conscheme
RUN cp conscheme compiler/conscheme.image /usr/local/conscheme/

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
