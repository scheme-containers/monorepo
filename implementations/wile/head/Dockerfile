FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    golang \
    make \
    git \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/aalpar/wile.git --depth=1
WORKDIR /build/wile
RUN make build
RUN install ./dist/*/*/wile /usr/local/bin/wile

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
COPY scheme-banner /usr/local/bin/
RUN ln -sf /usr/local/bin/wile /usr/local/bin/scheme-r7rs
CMD ["scheme-banner"]
