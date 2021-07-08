#!/bin/bash

FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="DHCP" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="ISC Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
  #update, upgrade, set timezone

RUN apt-get update -y && apt-get install -y \
  isc-dhcp-server \
  busybox
#install dhcp server

RUN touch /var/lib/dhcp/dhcpd.leases
#create empty lease file

EXPOSE 67/udp
#dhcp uses udp port 69

COPY dhcp/. /etc/dhcp/

CMD ["bash", "-c", "busybox syslogd -O /app/log/messages; dhcpd -4 -f -d"]
#common blocksize 1468 bytes
#https://manpages.debian.org/testing/tftpd-hpa/tftpd.8.en.html
#on cisco router, ensure
#ip tftp blocksize 1468
#ip tftp source-interface gi 0/0