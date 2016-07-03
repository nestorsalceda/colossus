FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --force-yes rygel gstreamer1.0-plugins-base \
       gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
       gstreamer1.0-plugins-ugly gstreamer1.0-libav

