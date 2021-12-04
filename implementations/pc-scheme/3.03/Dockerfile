FROM debian:jessie
RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
RUN apt-get update \
 && apt-get -y -u dist-upgrade \
 && apt-get -y --no-install-recommends install dosemu unzip \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /root/.dosemu/drive_c/pcs
ADD https://misc.lassi.io/2020/pc-scheme/extracted/pcs303.zip pcs.zip
RUN unzip -q pcs.zip && rm pcs.zip
WORKDIR /root
RUN printf '$_layout = "us"\n' >>/etc/dosemu/dosemu.conf \
 && printf 'c:\ncd \\pcs\npcs\nexitemu\n' >>/etc/dosemu/freedos/autoexec.bat
CMD ["dosemu", "-t"]
