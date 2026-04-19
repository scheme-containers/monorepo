FROM debian:trixie AS build
RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    gawk \
    flex \
    bison \
    ca-certificates \
    libc-dev \
    wget \
    pkg-config \
    git \
    libgmp-dev \
    python3 \
    ninja-build \
    meson \
    libelf-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN wget -O nasm-segelf.tar.gz https://github.com/stsp/nasm-segelf/archive/refs/tags/nasm-segelf-2.16.01-4.tar.gz
RUN mkdir nasm-segelf && tar -C nasm-segelf --strip-components 1 -xf nasm-segelf.tar.gz
WORKDIR /build/nasm-segelf
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
WORKDIR /build
RUN wget -O fdpp.tar.gz https://github.com/dosemu2/fdpp/archive/refs/tags/1.10.tar.gz
RUN mkdir fdpp && tar -C fdpp --strip-components 1 -xf fdpp.tar.gz
#RUN git clone https://github.com/dosemu2/fdpp.git --depth=1
WORKDIR /build/fdpp
RUN sed -i 's/meson setup/meson setup \-\-prefix=\/usr\/local/' configure.meson
RUN ./configure.meson
RUN meson compile --verbose -C build
RUN meson install -C build
WORKDIR /build
RUN wget -O dosemu.tar.gz https://github.com/dosemu2/dosemu2/archive/refs/tags/dosemu2-2.0pre9-2.tar.gz
RUN mkdir dosemu && tar -C dosemu --strip-components 1 -xf dosemu.tar.gz
WORKDIR /build/dosemu
RUN ./autogen.sh
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
WORKDIR /build
RUN wget -O comcom64.tar.gz https://github.com/dosemu2/comcom64/archive/refs/tags/0.4.tar.gz
RUN mkdir comcom64 && tar -C comcom64 --strip-components 1 -xf comcom64.tar.gz

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libelf1 \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/ /usr/local/
WORKDIR /root/.dosemu/drive_c
RUN wget -O pcs.zip https://misc.lassi.io/2020/pc-scheme/extracted/pcs303.zip
RUN unzip -q pcs.zip && rm pcs.zip
WORKDIR /root/.dosemu/drive_c
RUN wget https://dosemu2.github.io/comcom64/files/comcom64.zip
RUN unzip comcom64.zip
RUN wget https://dosemu2.github.io/comcom64/files/comcom32.zip
RUN unzip comcom32.zip && ln -s comcom32.exe command.com
RUN mkdir -p /var/run/user/0/dosemu2
WORKDIR /root
ENV DOSEMU2_COMCOM_DIR=/root/.dosemu/drive_c/
#RUN printf '$_layout = "us"\n' >>/etc/dosemu/dosemu.conf \
 #&& printf 'c:\ncd \\pcs\npcs\nexitemu\n' >>/etc/dosemu/freedos/autoexec.bat
CMD ["dosemu", "-t"]
