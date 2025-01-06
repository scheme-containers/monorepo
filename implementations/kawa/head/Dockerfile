# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      build-essential ca-certificates git curl unzip zip autoconf automake texinfo \
 && rm -rf /var/lib/apt/lists/*
SHELL ["/bin/bash", "-c"]
RUN curl https://get.sdkman.io | bash
RUN source /root/.sdkman/bin/sdkman-init.sh && sdk install java 11.0.24-tem
ENV PATH=/root/.sdkman/candidates/java/11.0.24-tem/bin:${PATH}
WORKDIR /build
RUN git clone https://gitlab.com/kashell/Kawa.git kawa --depth 1
WORKDIR kawa
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
      openjdk-22-jdk-headless \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin
COPY scheme-r7rs /usr/local/bin
CMD ["scheme-banner"]
