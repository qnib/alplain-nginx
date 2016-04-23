#!/usr/local/bin/dumb-init /bin/bash
set -e

### Put consul check in place
if [ ! -f /etc/consul.d/nginx.json ];then
    if [ -d /etc/consul.d ];then
        cp /opt/qnib/nginx/consul.d/nginx.json /etc/consul.d/
        /opt/qnib/consul/bin/consul reload
    else
        msg="WARN: No consul.d directory found... skipping Consul config"
        logger ${msg}
        echo ${msg}
    fi
fi

/usr/sbin/nginx
