FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y transmission-daemon

VOLUME ["/downloads"]

COPY settings.json /etc/transmission-daemon/

EXPOSE 9091
CMD ["transmission-daemon", "-f", "-g", "/etc/transmission-daemon"]

