# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://cm-gitlab.stanford.edu/bil/s7.git --depth 1
WORKDIR /build/s7
RUN echo '#define S7_LOAD_PATH "/usr/local/lib/s7"' > mus-config.h
RUN gcc s7.c -o s7 -DWITH_MAIN -I. -O2 -g -ldl -lm -Wl,-export-dynamic
RUN ./s7 libc.scm
RUN mkdir /usr/local/lib/s7 \
    && cp *.scm libc_s7.so /usr/local/lib/s7/ \
    && cp -v s7 /usr/local/bin/

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
ENV LANG=en_US.UTF-8
RUN ln -s s7 /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
