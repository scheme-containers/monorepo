# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/larceny AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates \
      git \
      wget \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/larcenists/larceny.git --depth=1

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libc6-i386 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/lib/larceny/ /usr/local/lib/larceny/
COPY scheme-banner scheme-script /usr/local/bin/
RUN ln -s ../lib/larceny/larceny /usr/local/bin/larceny
CMD ["scheme-banner"]
