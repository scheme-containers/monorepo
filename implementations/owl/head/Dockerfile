# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/owl AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/owl-lisp/owl.git --depth 1 --tags
WORKDIR /build/owl
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
