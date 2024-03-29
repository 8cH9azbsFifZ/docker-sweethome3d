FROM debian:latest

MAINTAINER Gerolf Ziegenhain <gerolf.ziegenhain@gmail.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update 
RUN apt-get -y install xvfb x11vnc xdotool wget tar supervisor net-tools fluxbox
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ENV DISPLAY :0

WORKDIR /root/
RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.1.0 /root/novnc && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html
RUN wget -O - https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar -xzv -C /root/ && mv /root/websockify-0.9.0 /root/novnc/utils/websockify

RUN apt-get -y install sweethome3d sweethome3d-furniture sweethome3d-furniture-editor sweethome3d-textures-editor
ADD sweethome3d /usr/bin
RUN apt-get -qqy autoclean && rm -rf /tmp/* /var/tmp/*
RUN chmod -R oag+rwx /var/log
USER 1000:1000

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
