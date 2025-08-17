# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bullseye-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      ca-certificates git \
      cpio make \
      llvm-11 llvm-11-dev lld-11 clang-11 \
 && rm -rf /var/lib/apt/lists/* \
 && update-alternatives --install \
      /usr/bin/llvm-config llvm-config \
      /usr/bin/llvm-config-11 10 \
 && update-alternatives --install \
      /usr/bin/lld lld \
      /usr/bin/lld-11 10 \
 && update-alternatives --install \
      /usr/bin/clang++ clang++ \
      /usr/bin/clang++-11 10 \
 && true
WORKDIR /build
RUN git clone https://github.com/fujita-y/digamma.git --depth 1
WORKDIR /build/digamma
RUN make
RUN make check
RUN make install

FROM debian:trixie-slim
COPY --from=build /usr/lib/x86_64-linux-gnu/libz3.so.4 /usr/lib/
COPY --from=build /usr/lib/x86_64-linux-gnu/libedit.so.2 /usr/lib/
COPY --from=build /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/
COPY --from=build /usr/lib/llvm-11/lib/libLLVM-11.so.1 /usr/lib/
COPY --from=build /usr/local/ /usr/local/
COPY scheme-script /usr/local/bin
RUN ln -s digamma /usr/local/bin/scheme-banner
CMD ["scheme-banner"]
