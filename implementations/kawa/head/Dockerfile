# -*- mode: dockerfile; coding: utf-8 -*-
# Installing the JDK or the JRE does not seem to work in bullseye-slim.
FROM debian:bullseye AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      git ca-certificates \
      autoconf automake libtool m4 texinfo \
      build-essential \
      default-jdk-headless \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/kashell/Kawa.git kawa --depth 1
WORKDIR /build/kawa
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

FROM debian:bullseye
RUN apt-get update && apt-get -y --no-install-recommends install \
      default-jre-headless \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
