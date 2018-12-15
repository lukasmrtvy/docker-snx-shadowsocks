FROM ubuntu:bionic

ARG SNX_URL

ENV SNX_URL https://vpnportal.aktifbank.com.tr/SNX/INSTALL/snx_install.sh

ENV UID 1337
ENV GID 1337

ENV USER johndoe
ENV GROUP johndoe

COPY /conf/supervisord.conf /
COPY /scripts/snx.sh /
COPY /scripts/entrypoint.sh /

RUN groupadd -r -g ${GID} ${GROUP} && adduser --disabled-password --uid ${UID} --ingroup ${GROUP} --gecos '' ${USER} && \
    dpkg --add-architecture i386 &&  \
    apt update && apt install -y \
        wget \
	expect \
 	kmod \
	libpam0g:i386 \
	libx11-6:i386 \
	libstdc++6:i386 \
	libstdc++5:i386 \
	shadowsocks-libev \
	iptables \
	supervisor &&  \
    wget "${SNX_URL}" -O /tmp/snx_install.sh &&  \
    chmod +x /tmp/snx_install.sh &&  \
    /tmp/snx_install.sh && \
    chmod +x /snx.sh /entrypoint.sh

EXPOSE 9001
EXPOSE  8388/tcp 8388/udp

USER root

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/supervisord", "-c /supervisord.conf"]
