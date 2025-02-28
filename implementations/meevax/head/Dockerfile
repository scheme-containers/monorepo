# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential wget ca-certificates cmake libgmp-dev git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/yamacir-kit/meevax.git --depth=1
WORKDIR /build/meevax
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release
WORKDIR /build/meevax/build
RUN make all
RUN make install

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -s /usr/local/bin/meevax /usr/local/bin/scheme-banner \
 && ln -s /usr/local/bin/meevax /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
