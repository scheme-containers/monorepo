# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build/picrin
RUN git init \
 && git remote add origin https://github.com/marijnh/uscheme.git \
 && git fetch origin 7fce0b6e7875337da9a6a2300d8074f01e4b68d2 --depth 1 --tags \
 && git reset --hard FETCH_HEAD
RUN make
RUN make install

FROM debian:bullseye-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s uscheme /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
