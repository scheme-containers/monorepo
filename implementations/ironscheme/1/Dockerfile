# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
      unzip \
      wget \
      git \
      libicu-dev \
      libc6 \
      libgcc-s1 \
      libgssapi-krb5-2 \
      libicu-dev \
      libssl-dev \
      libstdc++6 \
      zlib1g \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN mkdir ironscheme
WORKDIR /build/ironscheme
COPY checksum checksum
RUN wget -O IronScheme.zip https://github.com/IronScheme/IronScheme/releases/download/1.0.603/IronScheme-1.0.603-636c88b.zip
RUN sha256sum IronScheme.zip && sha256sum -c checksum
RUN unzip IronScheme.zip
RUN rm checksum IronScheme.zip

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y \
    wget \
    libicu-dev \
    libc6 \
    libgcc-s1 \
    libgssapi-krb5-2 \
    libssl3 \
    libstdc++6 \
    zlib1g \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh \
    && bash dotnet-install.sh --channel STS
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=/root/.dotnet
ENV PATH=/root/.dotnet:${PATH}
COPY --from=build /build/ironscheme /opt/ironscheme
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
CMD ["scheme-banner"]
