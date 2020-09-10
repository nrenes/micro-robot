#!/usr/bin/env bash


# register consul-agent to the consul-server
#export CONSUL_HTTP_SSL_VERIFY=false

#consul agent -data-dir=/etc/consul.d -node=client-3 -retry-join=${CONSUL_SERVER} &
#sleep 30
#consul services register -name=user

exec node server.js