# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      gcc \
      libc6-dev \
      libx11-dev \
      uuid-dev \
      make \
      ncurses-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
ADD https://github.com/cisco/ChezScheme/releases/download/v10.0.0/csv10.0.0.tar.gz chezscheme.tar.gz
RUN sha256sum chezscheme.tar.gz && sha256sum -c checksum
RUN mkdir chezscheme && tar -C chezscheme -xf chezscheme.tar.gz --strip-components 1
WORKDIR /build/chezscheme
#RUN mkdir chezscheme && tar -C chezscheme -xf chezscheme.tar.gz
#RUN sed -ie 's,expeditor,,' s/*.def
RUN ./configure --prefix=/usr/local
RUN make build
#RUN make -C build clean
#RUN sed -ie 's,-lncurses,,' c/Mf-*
#RUN rm build/boot/*/equates.h
#RUN cp -fr build/boot/* boot/
#RUN make clean && rm -rf build
#RUN ./configure --workarea=build  # Different with/without threads.
#RUN make -C build
RUN make install
#RUN rm -rf /usr/lib/csv9.5.4/examples
#RUN scheme --version

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      libncurses6 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local /usr/local
COPY scheme-banner /usr/local/bin/
RUN ln -s scheme /usr/bin/scheme-script \
 && ln -s scheme /usr/bin/petite
CMD ["scheme-banner"]
