FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y rygel gstreamer1.0-plugins-base \
       gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
       gstreamer1.0-plugins-ugly gstreamer1.0-libav \
    && rm -fr /var/lib/apt/lists/*

COPY rygel.conf /etc/rygel.conf
EXPOSE 8000/tcp 1900/udp
CMD ["/usr/bin/rygel"]
