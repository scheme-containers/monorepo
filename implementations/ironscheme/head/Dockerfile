# -*- mode: dockerfile; coding: utf-8 -*-
FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get -y --no-install-recommends install \
    gpg \
    wget \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://packages.microsoft.com/keys/microsoft.asc && cat microsoft.asc | gpg --dearmor -o microsoft.asc.gpg
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
RUN apt-get update && apt-get install -y dotnet-sdk-9.0
WORKDIR /build
RUN git clone https://github.com/IronScheme/IronScheme.git \
    -b master --recurse-submodules
WORKDIR /build/IronScheme/IronScheme
RUN sh build.sh
#RUN sh test.sh
#RUN sh package.sh
#RUN sh nuget.sh

FROM debian:bookworm-slim
RUN apt-get update && apt-get -y --no-install-recommends install \
    gpg \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://packages.microsoft.com/keys/microsoft.asc && cat microsoft.asc | gpg --dearmor -o microsoft.asc.gpg
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
RUN apt-get update && apt-get install -y aspnetcore-runtime-9.0
COPY --from=build /build/IronScheme/IronScheme /usr/local/IronScheme/
ENV LANG C.UTF-8
COPY ironscheme /usr/local/bin/
RUN ln -s ironscheme /usr/local/bin/isc && \
    ln -s ironscheme /usr/local/bin/scheme-banner && \
    ln -s ironscheme /usr/local/bin/scheme-script
CMD ["scheme-banner"]
