# -*- mode: dockerfile; coding: utf-8 -*-

FROM schemers/cyclone AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/justinethier/cyclone.git
WORKDIR /build/cyclone
RUN echo "Bootstrapping from Cyclone $(cyclone -vn)"
RUN git log -n 1
RUN make
RUN make install
RUN make test

FROM debian:sid-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc libc-dev libck0 libck-dev libtommath1 libtommath-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
CMD ["scheme-banner"]
