FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y munin
RUN apt-get install -y apache2

RUN (cp /etc/munin/apache.conf /etc/apache2/sites-enabled/default)
RUN (sed -i 's/^Alias.*/Alias \/ \/var\/cache\/munin\/www\//g' /etc/apache2/sites-enabled/default)
RUN (sed -i 's/Allow from localhost.*/Allow from all/g' /etc/apache2/sites-enabled/default)
RUN (mkdir -p /var/run/munin && chown -R munin:munin /var/run/munin)

ADD run.sh /usr/local/bin/run

VOLUME /var/lib/munin
VOLUME /var/log/munin

EXPOSE 80

CMD ["/usr/local/bin/run"]
