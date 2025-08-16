# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      nodejs \
      npm \
 && rm -rf /var/lib/apt/lists/*
RUN npm install -g @jcubic/lips@beta

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      nodejs \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
RUN ln -s lips /usr/local/bin/scheme-banner \
 && ln -s lips /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
