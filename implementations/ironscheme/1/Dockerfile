# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip \
      wget \
      libicu-dev \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY checksum checksum
RUN wget -O IronScheme.zip https://github.com/IronScheme/IronScheme/releases/download/1.0.575/IronScheme-1.0.575-91bdd4b.zip
RUN sha256sum IronScheme.zip && sha256sum -c checksum
RUN unzip -d IronScheme IronScheme.zip && mv IronScheme /usr/local

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y wget libicu-dev
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh \
    && bash dotnet-install.sh --channel STS
COPY --from=build /usr/local/IronScheme /usr/local/IronScheme/
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
RUN ln -sf ${HOME}/.dotnet/dotnet /usr/local/bin/dotnet
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=${HOME}/.dotnet
CMD ["scheme-banner"]
