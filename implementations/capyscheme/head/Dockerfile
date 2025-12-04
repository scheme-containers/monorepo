# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    ca-certificates \
    wget \
    xz-utils \
    make \
    just \
    libffi-dev \
    build-essential \
    clang \
    rsync \
  && rm -rf /var/lib/apt/lists/*
RUN wget -O rust.tar.xz https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.xz
RUN mkdir rust && tar -C rust --strip-components 1 -xf rust.tar.xz && cd rust && bash install.sh
WORKDIR /build
RUN git clone https://github.com/playX18/capyscheme.git --depth=2
WORKDIR /build/capyscheme
RUN just install-prefix=/usr/other install-portable

FROM debian:trixie-slim
COPY --from=build /usr/other/ /usr/local/
RUN apt-get update && apt-get install -y lld
ENV PATH=/usr/local/capy/0.1.0:${PATH}
RUN capy --help # Precompile the cache
COPY scheme-banner /usr/local/bin/
CMD scheme-banner
