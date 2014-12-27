#!/bin/bash
NODES=${NODES:-}
# generate node list
for NODE in $NODES
do
	NAME=`echo $NODE | cut -d ':' -f1`
	HOST=`echo $NODE | cut -d ':' -f2`
	cat << EOF >> /etc/munin/munin.conf
[$NAME]
	address $HOST
	use_node_name yes
EOF
done
# start cron
/usr/sbin/cron &
# start local munin-node
/usr/sbin/munin-node > /dev/null 2>&1 &
echo "Using the following munin nodes:"
echo $NODES
# start apache
/usr/sbin/apache2ctl -DFOREGROUND
