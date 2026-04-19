# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates \
    git \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh \
    && bash dotnet-install.sh --version 9.0.313 --install-dir /usr/local/bin
WORKDIR /build
RUN git clone https://github.com/IronScheme/IronScheme.git --branch 1.0.603 --recurse-submodules
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=/usr/local/bin
WORKDIR /build/IronScheme/IronScheme
RUN sh build.sh
#RUN sh test.sh
#RUN sh package.sh
#RUN sh nuget.sh

FROM debian:trixie-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh \
    && bash dotnet-install.sh --version 9.0.313 --install-dir /usr/local/bin
COPY --from=build /build/IronScheme/IronScheme /usr/local/IronScheme/
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=/usr/local/bin
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
CMD ["scheme-banner"]
