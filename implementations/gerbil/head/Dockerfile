# -*- mode: dockerfile; coding: utf-8 -*-

# NB: There is an official Gerbil Dockerfile at
# <https://github.com/vyzo/gerbil/blob/master/Dockerfile>
FROM schemers/gambit AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates \
      git \
      build-essential \
      libsqlite3-dev \
      libssl-dev \
      openssl \
      sqlite3 \
      zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
ENV GERBIL_PREFIX=/usr/local
ENV GERBIL_BUILD_CORES=4
WORKDIR /build
RUN git clone https://github.com/mighty-gerbils/gerbil.git --depth 1
WORKDIR /build/gerbil/src
RUN ./build.sh

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates gcc git libc-dev \
 && rm -rf /var/lib/apt/lists/*
ENV GERBIL_PREFIX=/usr/local
COPY --from=build /usr/local/ /usr/local/
COPY --from=build /build/gerbil/bin/ /usr/local/bin/
COPY --from=build /build/gerbil/lib/ /usr/local/lib/
ENV GERBIL_HOME=/usr/local
RUN ln -s gxi /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
