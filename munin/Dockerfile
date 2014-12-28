FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y munin
RUN apt-get install -y apache2
RUN apt-get install -y smartmontools
RUN apt-get install -y lm-sensors i2c-tools
RUN apt-get install -y python

RUN (cp /etc/munin/apache.conf /etc/apache2/sites-enabled/default)
RUN (sed -i 's/^Alias.*/Alias \/ \/var\/cache\/munin\/www\//g' /etc/apache2/sites-enabled/default)
RUN (sed -i 's/Allow from localhost.*/Allow from all/g' /etc/apache2/sites-enabled/default)
RUN (mkdir -p /var/run/munin && chown -R munin:munin /var/run/munin)

ADD run.sh /usr/local/bin/run

RUN chown munin:munin /var/lib/munin
RUN chown munin:munin /var/log/munin

ADD hddtemp_smartctl /etc/munin/plugin-conf.d/hddtemp_smartctl
RUN ln -s /usr/share/munin/plugins/hddtemp_smartctl /etc/munin/plugins/hddtemp_smartctl

RUN ln -s /usr/share/munin/plugins/smart_ /etc/munin/plugins/smart_sda
RUN ln -s /usr/share/munin/plugins/smart_ /etc/munin/plugins/smart_sdb
RUN ln -s /usr/share/munin/plugins/smart_ /etc/munin/plugins/smart_sdc
RUN ln -s /usr/share/munin/plugins/smart_ /etc/munin/plugins/smart_sdd

RUN ln -s /usr/share/munin/plugins/sensors_ /etc/munin/plugins/sensors_temp
RUN ln -s /usr/share/munin/plugins/sensors_ /etc/munin/plugins/sensors_fan
RUN ln -s /usr/share/munin/plugins/sensors_ /etc/munin/plugins/sensors_volt

EXPOSE 80

CMD ["/usr/local/bin/run"]
