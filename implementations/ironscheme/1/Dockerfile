# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
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
RUN wget https://dot.net/v1/dotnet-install.sh && bash dotnet-install.sh --channel STS
RUN git clone https://github.com/IronScheme/IronScheme.git -b master --recurse-submodules --depth=1
#COPY checksum checksum
#RUN wget -O IronScheme.zip https://github.com/IronScheme/IronScheme/releases/download/1.0.603/IronScheme-1.0.603-636c88b.zip
#RUN sha256sum IronScheme.zip && sha256sum -c checksum
#RUN unzip -d IronScheme IronScheme.zip && mv IronScheme /usr/local
WORKDIR /build/IronScheme/IronScheme
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV PATH=/root/.dotnet:${PATH}
RUN sh build.sh
RUN sh package.sh
RUN nuget.sh

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y \
    wget \
    libicu-dev \
    libc6 \
    libgcc-s1 \
    libgssapi-krb5-2 \
    libicu72 \
    libssl3 \
    libstdc++6 \
    zlib1g \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh \
    && bash dotnet-install.sh --channel STS
COPY --from=build /usr/local/IronScheme /usr/local/IronScheme/
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
RUN ln -sf ${HOME}/.dotnet/dotnet /usr/local/bin/dotnet
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=/root/.dotnet
CMD ["scheme-banner"]
