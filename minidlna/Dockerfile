FROM debian:wheezy
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y minidlna

COPY minidlna.conf /etc/minidlna.conf

EXPOSE 1900/udp
EXPOSE 8200
CMD ["minidlna", "-d"]
