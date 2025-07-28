# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc-dev \
      libncurses-dev \
      m4 \
      make \
      texinfo \
      mit-scheme \
      ca-certificates \
      git \
      automake \
      texinfo \
      libtool \
      build-essential \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://git.savannah.gnu.org/git/mit-scheme.git --depth=1
WORKDIR /build/mit-scheme/src
RUN bash Setup.sh
RUN ./configure
RUN make
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s mit-scheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
