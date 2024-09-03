# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://gitlab.com/jobol/tr7.git --depth=1
WORKDIR /build/tr7
RUN make
RUN cp tr7i /usr/local/bin/

FROM debian:bookworm-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
COPY scheme-r7rs /usr/local/bin/
RUN ldconfig
ENV TR7_LIB_PATH=/build/tr7/tr7libs
CMD ["scheme-banner"]
