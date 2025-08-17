# -*- mode: dockerfile; coding: utf-8 -*-
FROM schemers/chibi:head AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates git \
      build-essential \
      autoconf automake m4 \
      git-merge-changelog \
      gnulib \
      help2man \
      texinfo \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/nieper/unsyntax.git --depth=1
WORKDIR /build/unsyntax
#RUN git submodule update --init --depth=1
RUN ./bootstrap --gnulib-srcdir=/usr/share/gnulib --no-git
RUN ./configure
RUN make
RUN make install

FROM schemers/chibi:head
COPY --from=build /usr/local/ /usr/local/
RUN rm /usr/local/bin/scheme-banner \
 && ln -s unsyntax-scheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
