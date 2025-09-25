FROM debian:trixie-slim AS build
RUN apt-get update && apt-get install -y build-essential git-svn autoconf
WORKDIR /build
RUN git svn clone svn://svn.zoy.org/elk/trunk
WORKDIR /build/elk/trunk
RUN autoconf
RUN ./configure --prefix=/usr/local
RUN make PREFIX=/usr/local
RUN make PREFIX=/usr/local install

FROM debian:trixie-slim
COPY --from=build /usr/local/ /usr/local/
RUN ln -sf /usr/local/bin/elk /usr/local/bin/scheme-banner
CMD scheme-banner
