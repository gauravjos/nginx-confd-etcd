#!/bin/bash

set -e

if [ -z "$ETCDKEY" ]
 then
  	echo  "ETCDKEY not set!! exiting..";
	exit 1;
elif [ -z "$ETCDURL" ]
 then
	echo "ETCDURL not set!! exiting..";
	exit 1;
else
	sed -i "s/ETCDKEY/$ETCDKEY/g" /etc/confd/conf.d/nginx.toml
	sed -i "s/ETCDKEY/$ETCDKEY/g" /etc/confd/templates/nginx.conf.tmpl
fi
Confdinterval=${CONFDINT:-5}
echo "Running confd at interval $Confdinterval secs and having etcdkey:$ETCDKEY and etcdURL:$ETCDURL "

confd -interval "$Confdinterval" -backend etcd -node  "$ETCDURL" &

echo "Starting Nginx"
exec /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

