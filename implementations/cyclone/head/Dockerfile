# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential \
      ca-certificates \
      git \
      wget \
      libck-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O cyclone-bootstrap.tar.gz https://github.com/justinethier/cyclone-bootstrap/archive/refs/tags/v0.36.0.tar.gz
RUN mkdir cyclone-bootstrap && tar -C cyclone-bootstrap --strip-components 1 -xf cyclone-bootstrap.tar.gz
WORKDIR /build/cyclone-bootstrap
RUN make
RUN make install
WORKDIR /build
RUN git clone https://github.com/justinethier/cyclone.git --depth=1
#RUN apt-get update && apt-get install -y plocate
#RUN updatedb
#RUN locate cyclone
#RUN cyclone --help
WORKDIR /build/cyclone
RUN echo "Bootstrapping from Cyclone $(cyclone -vn)"
#RUN git log -n 1
RUN make
RUN make install
RUN make test

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
      libck0 \
      libck-dev \
      libtommath1 \
      libtommath-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
CMD ["scheme-banner"]
