# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates wget gpg wine \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O racket.tgz https://download.racket-lang.org/releases/8.15/installers/racket-minimal-8.15-x86_64-win32-cs.tgz
RUN sha256sum racket.tgz && sha256sum -c checksum
RUN mkdir racket && tar -C racket --strip-components 1 -xf racket.tgz
RUN mkdir -p /root/.wine/drive_c/Program\ Files/ \
    && mv racket /root/.wine/drive_c/Program\ Files/Racket
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Racket
RUN wine raco.exe pkg install --auto r7rs > /dev/null

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates wine \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /root/.wine /root/.wine
ENV WINEPATH=/root/.wine/drive_c/Program\ Files/Racket
COPY racket scheme-banner scheme-r7rs scheme-script /usr/local/bin/
CMD scheme-banner
