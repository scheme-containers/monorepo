# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN rm -f /usr/local/bin/scheme-banner
RUN apt-get update && apt-get -y --no-install-recommends install \
      autoconf \
      build-essential \
      ca-certificates \
      git \
      scheme48 \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/scheme/scsh.git --depth=1
WORKDIR /build/scsh
RUN git submodule update --init
#RUN git init \
 #&& git remote add origin https://github.com/scheme/scsh.git \
 #&& git fetch origin 6770db21b08edd907d1c9bd962297ff55664e3fe --depth 1 --tags \
 #&& git reset --hard FETCH_HEAD
#RUN git submodule update --init \
 #&& (cd rx && git reset --hard d3231ad13de2b44e3ee173b1c9d09ff165e8b6d5)
RUN autoreconf
RUN ./configure
RUN make
RUN make test
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s scsh /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
