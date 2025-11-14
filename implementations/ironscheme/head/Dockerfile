# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:trixie-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates \
    git \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh \
    && bash dotnet-install.sh --channel STS
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=${HOME}/.dotnet
ENV PATH=${HOME}/.dotnet:${PATH}
WORKDIR /build
RUN git clone https://github.com/IronScheme/IronScheme.git \
    -b master --recurse-submodules
WORKDIR /build/IronScheme/IronScheme
RUN DOTNET_ROOT=$HOME/.dotnet PATH=${HOME}/.dotnet:${PATH} sh build.sh
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
    && bash dotnet-install.sh --channel STS
COPY --from=build /build/IronScheme/IronScheme /usr/local/IronScheme/
ENV LANG C.UTF-8
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
RUN ln -sf ${HOME}/.dotnet/dotnet /usr/local/bin/dotnet
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_ROOT=${HOME}/.dotnet
CMD ["scheme-banner"]
