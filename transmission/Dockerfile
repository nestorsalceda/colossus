FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y transmission-daemon \
    && rm -fr /var/lib/apt/lists/*

EXPOSE 9091
CMD ["transmission-daemon", "-f", "-g", "/etc/transmission-daemon"]

