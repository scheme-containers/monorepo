# NOTE: Parallel make of single-host Gambit takes ~1G RAM per core.

FROM debian:bullseye
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates build-essential ghostscript texinfo \
      autoconf automake m4 git \
      libcairo-dev libglu1-mesa libglu1-mesa-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/jazzscheme/jazz
RUN git clone https://github.com/jazzscheme/gambit
WORKDIR /build/gambit
RUN git fetch --tags https://github.com/gambit/gambit
RUN autoconf
RUN ./configure \
      --prefix=/usr/local/jazz-gambit \
      --enable-single-host \
      --enable-rtlib-debug-location \
      --enable-rtlib-debug-environments
RUN make
#RUN make check
RUN make install
ENV GAMBITDIR=/usr/local/jazz-gambit
ENV PATH=${GAMBITDIR}/bin:${PATH}
WORKDIR /build/jazz
RUN ./jaz configure l
RUN ./jaz make jazz@l
RUN ./jaz make @l
RUN ln -s /build/jazz/build/develop/c4             /usr/local/bin/ \
 && ln -s /build/jazz/build/develop/gomoku         /usr/local/bin/ \
 && ln -s /build/jazz/build/develop/gstreamer      /usr/local/bin/ \
 && ln -s /build/jazz/build/develop/jas            /usr/local/bin/ \
 && ln -s /build/jazz/build/develop/jazz           /usr/local/bin/ \
 && ln -s /build/jazz/build/develop/jazz-interpret /usr/local/bin/ \
 && ln -s /build/jazz/build/develop/shader         /usr/local/bin/ \
 && ln -s jazz /usr/local/bin/scheme-banner
WORKDIR /root
CMD ["scheme-banner"]
