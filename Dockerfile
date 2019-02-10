#BUILDS qlustor/nrserver-pro

FROM phusion/baseimage
MAINTAINER Team QLUSTOR <team@qlustor.com>

ENV NRSERVER_DEB_NAME "nrserver-2.4.4.4500-pro-ubuntu-amd64.deb"
ENV NRSERVER_DEB_URL  "http://download.neorouter.com/Downloads/NRPro/Update_2.4.4.4500/Linux/Ubuntu"
    
ADD . /
RUN apt-get update && /sbin/install_clean -y wget && \
    wget -P / $NRSERVER_DEB_URL/$NRSERVER_DEB_NAME && \
    chmod a+x /etc/service/nrserver/run && \
    dpkg -i /$NRSERVER_DEB_NAME

EXPOSE 32976
VOLUME /usr/local/ZebraNetworkSystems/NeoRouter

ENTRYPOINT ["/sbin/my_init"]
