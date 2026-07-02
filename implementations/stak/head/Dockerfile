# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:testing AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    ca-certificates \
    wget \
    xz-utils \
    build-essential \
    rustc \
    cargo \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/raviqqe/stak.git --depth=1
WORKDIR /build/stak
RUN cargo install stak --root /usr/other

FROM debian:testing
COPY --from=build /usr/other/ /usr/other
ENV PATH=/usr/other/bin:${PATH}
COPY scheme-banner /usr/local/bin/
CMD scheme-banner
