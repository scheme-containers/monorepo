# -*- mode: dockerfile; coding: utf-8 -*-
# Need bullseye for notcurses.
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git rsync libnotcurses-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
# Debian does not have the certificate; remove GIT_SSL_NO_VERIFY once it does.
RUN GIT_SSL_NO_VERIFY=yes \
      git clone https://cm-gitlab.stanford.edu/bil/s7.git --depth 1
WORKDIR /build/s7
RUN echo '#define S7_LOAD_PATH "/usr/local/lib/s7"' >mus-config.h
RUN gcc -o s7 s7.c nrepl.c -ldl -lm -lnotcurses -rdynamic -O2 -g -I .
RUN ./s7 libc.scm
RUN find . -name '*.scm' | rsync -va --files-from - ./ /usr/local/lib/s7/ \
 && cp -v libc_s7.so /usr/local/lib/s7/ \
 && cp -v s7 /usr/local/bin/

FROM debian:bullseye-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libnotcurses2 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
ENV LANG=en_US.UTF-8
RUN ln -s s7 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
