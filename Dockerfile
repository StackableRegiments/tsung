FROM debian:jessie
MAINTAINER Chris Hagan<chris@stackableregiments.com>

ADD scripts /srv

RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tsung vim openssh-server yaws curl

RUN (echo "ssh-keygen -t rsa -f rsa.pub -N ''")
RUN (echo "cat rsa >> ~/.ssh/authorized_keys")

CMD ["/bin/bash"]