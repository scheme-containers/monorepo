# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/jobol/tr7.git --depth=1
WORKDIR /build/tr7
RUN make tr7i
#RUN make test
RUN make install

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s tr7i /usr/local/bin/scheme-banner \
 && ln -s tr7i /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
