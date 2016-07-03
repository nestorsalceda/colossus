FROM debian
MAINTAINER Néstor Salceda <nestor@nestorsalceda.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    cron \
    munin \
    apache2 libcgi-fast-perl libapache2-mod-fcgid \
    smartmontools \
    lm-sensors i2c-tools \
    python \
    && rm -fr /var/lib/apt/lists/*


RUN (cp /etc/munin/apache24.conf /etc/apache2/sites-enabled/000-default.conf)
RUN (sed -i 's/^Alias.*/Alias \/ \/var\/cache\/munin\/www\//g' /etc/apache2/sites-enabled/000-default.conf)
RUN (sed -i 's/Require local/Require all granted/g' /etc/apache2/sites-enabled/000-default.conf)
RUN (mkdir -p /var/run/munin && chown -R munin:munin /var/run/munin)
RUN (mkdir -p /var/log/munin && chown -R munin:munin /var/log/munin)
RUN (mkdir -p /var/lib/munin && chown -R munin:munin /var/lib/munin)

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

RUN ln -s /usr/share/munin/plugins/ping_ /etc/munin/plugins/ping_8.8.8.8

EXPOSE 80

CMD ["/usr/local/bin/run"]
