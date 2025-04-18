# -*- mode: dockerfile; coding: utf-8 -*-

# NB: There is an official Gerbil Dockerfile at
# <https://github.com/vyzo/gerbil/blob/master/Dockerfile>
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    ca-certificates \
    build-essential \
    libsqlite3-dev \
    libssl-dev \
    openssl \
    sqlite3 \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/mighty-gerbils/gerbil.git
WORKDIR /build/gerbil
RUN ./configure
RUN make -j16
RUN make install

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates gcc git libc-dev \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /opt/gerbil /opt/gerbil
ENV PATH=/opt/gerbil/bin:${PATH}
RUN ln -s /opt/gerbil/bin/gxi /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
