FROM nginx:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Reverse Proxy" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

#ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

#RUN export DEBIAN_FRONTEND=noninteractive && \
#  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
#  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
#  dpkg-reconfigure --frontend noninteractive tzdata
##update, upgrade, set timezone

#RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
#  libnginx-mod-http-fancyindex
#install fancyindex for more advance autoindex functions

#RUN chmod 777 /usr/local/bin/docker-entrypoint.sh && \
#  ln -s /usr/local/bin/docker-entrypoint.sh /

RUN rm -rf /var/log/nginx/*

COPY ./nginx/. /etc/nginx