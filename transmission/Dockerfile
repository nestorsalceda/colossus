FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y transmission-daemon

RUN MKDIR /downloads/transmission
COPY settings.json /downloads/transmission/

EXPOSE 9091
CMD ["transmission-daemon", "-f", "-g", "/downloads/transmission"]

