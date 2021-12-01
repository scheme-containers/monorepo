# Automatically generated

FROM debian:bullseye-slim AS build
RUN apt-get update -qq && apt-get install -qq --no-install-recommends build-essential file install-info libffi-dev libffi7 libgc-dev libgc1 libgmp-dev libgmp10 libpcre3-dev make texinfo && rm -rf /var/lib/apt/lists/*
WORKDIR /build
ADD ["http://www.stklos.net/download/stklos-1.70.tar.gz", "stklos-1.70.tar.gz"]
RUN echo "15a1251a0e72d66051011bb95ba9122b22f7acd8a5a0d0e4f8737cc9fcbb83c7  stklos-1.70.tar.gz" | sha256sum -c - && mkdir tmp && (cd tmp && tar -xzf ../stklos-1.70.tar.gz) && mv tmp/stklos-1.70 stklos && rm -rf tmp/
WORKDIR /build/stklos
RUN ["./configure", "--without-provided-bignum", "--without-provided-gc", "--without-provided-regexp"]
RUN ["make"]
RUN ["make", "install"]

FROM debian:bullseye-slim
RUN apt-get update -qq && apt-get install -qq --no-install-recommends libffi-dev libffi7 libgc-dev libgc1 libgmp-dev libgmp10 libpcre3-dev && rm -rf /var/lib/apt/lists/*
COPY --from=build ["/usr/local/", "/usr/local/"]
RUN ["ln", "-s", "stklos", "/usr/local/bin/scheme-banner"]
CMD ["scheme-banner"]
