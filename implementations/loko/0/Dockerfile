# -*- mode: dockerfile; coding: utf-8 -*-
FROM alpine:3.8 AS build
WORKDIR /build
COPY checksum checksum
ADD https://scheme.fail/releases/loko-0.12.1.tar.gz loko.tar.gz
RUN sha256sum loko.tar.gz && sha256sum -c checksum
RUN mkdir loko && tar -C loko --strip-components 1 -xf loko.tar.gz
WORKDIR /build/loko
RUN apk add make
RUN make
RUN make install

FROM alpine:3.8
COPY --from=build /usr/local /usr/local
RUN ln -s loko /usr/local/bin/scheme-banner \
 && ln -s loko /usr/local/bin/scheme-script
CMD ["scheme-banner"]
