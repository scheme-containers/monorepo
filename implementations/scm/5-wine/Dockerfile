# -*- mode: dockerfile; coding: utf-8 -*-
FROM alpine:edge AS build
RUN apk add 7zip wine wget
WORKDIR /build
COPY checksum checksum
RUN mkdir -p /root/.wine/drive_c/Program\ Files\ \(x86\)/scm
RUN wget -O slib.exe http://groups.csail.mit.edu/mac/ftpdir/scm/slib-3c1-1.exe
RUN wget -O scm.exe http://groups.csail.mit.edu/mac/ftpdir/scm/scm-5f4-1.exe
RUN sha256sum slib.exe scm.exe && sha256sum -c checksum
RUN 7z x -y slib.exe -o/root/.wine/drive_c/Program\ Files\ \(x86\)/scm
RUN 7z x -y scm.exe -o/root/.wine/drive_c/Program\ Files\ \(x86\)/scm

FROM alpine:edge
RUN apk add wine
COPY --from=build /root/.wine /root/.wine
ENV DISPLAY=
ENV WINEPATH="/root/.wine/drive_c/Program Files (x86)/scm"
COPY scm scheme-banner /usr/local/bin/
CMD scheme-banner
