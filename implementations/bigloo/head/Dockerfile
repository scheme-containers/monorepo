# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/bigloo AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf \
      automake \
      libtool \
      make \
      patch \
      zip \
      sqlite3 \
      gcc \
      libc-dev \
      libgmp-dev \
      libunistring-dev \
      libpcre2-dev \
      libsqlite3-dev \
      libssl-dev \
      git ca-certificates \
 && rm -rf /var/lib/apt/lists/*
RUN wget -O jdk-8.deb https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u442-b06/openlogic-openjdk-8u442-b06-linux-x64-deb.deb
RUN apt-get install -y ./jdk-8.deb
WORKDIR /build
RUN git clone https://github.com/manuel-serrano/bigloo.git --depth=1
WORKDIR /build/bigloo
#RUN git checkout 4.4b
#RUN ls -1
#RUN exit 1
#RUN ./configure
#RUN LD_LIBRARY_PATH=/usr/local/lib/bigloo/4.4b \ make bigboot BGLBUILDBINDIR=/usr/local/bin
#RUN find /usr/local -type f -delete
#RUN make install-progs
#RUN make fullbootstrap-sans-log
#RUN make install-sans-docs
#RUN make fulltest
RUN ./configure --bee=full --jvm=yes
RUN make
RUN make compile-bee
RUN make install-sans-docs
RUN make fulltest

FROM debian:trixie
RUN apt-get update && apt-get -y --no-install-recommends install \
      default-jre-headless \
      sqlite3 \
      gcc \
      libc-dev \
      libgmp-dev \
      libunistring-dev \
      libpcre2-dev \
      libsqlite3-dev \
      libssl-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s bigloo /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
