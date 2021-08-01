FROM ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Devbox" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Nginx Server" \
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

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  bash-completion \
  chrony \
  dnsutils \
  iputils-ping \
  iproute2 \
  nano \
  nmap \
  openssh-server \
  screen \
  snmp \
  ssh \
  sudo \
  telnet \
  traceroute \
  python3
  #install packages

RUN useradd -m -s /bin/bash admin && \
  usermod -aG sudo admin && \
  passwd -d admin && \
  #create admin user and remove password
  \
  echo "AllowUsers admin" >> /etc/ssh/sshd_config && \
  echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  #only allow admin ssh acccess adn force ssh key auth only
  \
  cd /home/admin && \
  mkdir .ssh && \
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYneapDm96NAVQea3fwhrFyjd4VVM7CPLW7SvIPRKtpo684vfL8DEGQNANAU3MjDCDCt7Od9RxmfhyochqnvMcNRZQ6dSOy5pdVwlHJuAXvf0WSwC7LBQW+Q87COVPS2AoXUyaYR4eAEGqQBQmcfH+0qu4r0WQr41dP+OYV9ZsvSWQ9EKhruiUabA+3aOxYZ0K3aAOwbSmrHlPy9B1Rbr5nPGW5KUHTKJ5OdVEjQNhMBugvnEbpyV7WBw5DH2kXgUk7JyY1YAGKgD6TvH3ho0NtBfofvXzq7/yujH+4mOnZasjnmokjDnOwRylfzpU8Z1L3iM2R764Vw43VIYDkCl3" > .ssh/authorized_keys && \
  chown -R admin:admin .ssh && \
  #add key to authorized ssh key file
  \
  service ssh start

CMD ["/usr/sbin/sshd", "-D"]