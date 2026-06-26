# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:testing AS build
RUN apt-get update && apt-get install -y \
  git \
  ca-certificates \
  wget \
  xz-utils \
  make \
  build-essential \
  rsync \
  rustc \
  cargo \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://codeberg.org/playXE/capy.git --depth=1
WORKDIR /build/capy
RUN make PREFIX=/usr/other
RUN make PREFIX=/usr/other install

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y binutils
COPY --from=build /usr/other/ /usr/other/
ENV PATH=/usr/other/bin:${PATH}
COPY scheme-banner /usr/local/bin/
CMD ["scheme-banner"]
