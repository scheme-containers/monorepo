# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      npm nodejs \
 && rm -rf /var/lib/apt/lists/*
RUN npm install -g @jcubic/lips@beta

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      nodejs \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -s /usr/local/bin/lips /usr/local/bin/scheme-r7rs
RUN ln -s /usr/local/bin/lips /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
