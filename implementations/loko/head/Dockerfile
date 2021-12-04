# -*- mode: dockerfile; coding: utf-8 -*-
FROM akkuscm/akku:latest AS build
WORKDIR /build
RUN git clone --depth 1 https://gitlab.com/weinholt/loko.git
WORKDIR /build/loko
RUN akku --debug install
RUN apk add make
RUN make
RUN make install && rm /usr/local/bin/scheme-banner

FROM debian:bullseye-slim
COPY --from=build /usr/local /usr/local
RUN ln -s loko /usr/local/bin/scheme-banner \
 && ln -s loko /usr/local/bin/scheme-script
CMD ["scheme-banner"]
