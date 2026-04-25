# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O owl.tar.gz https://gitlab.com/owl-lisp/owl/-/archive/v0.2.1/owl-v0.2.1.tar.gz
RUN mkdir owl && tar -C owl --strip-components 1 -xf owl.tar.gz
WORKDIR /build
RUN git clone https://gitlab.com/owl-lisp/owl.git owl-git --depth 1 --tags
WORKDIR /build/owl-git
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
