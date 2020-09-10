#!/usr/bin/env sh

#yum makecache
#yum -y update
#yum -y install unzip wget

#cd /usr/local/bin
#wget https://releases.hashicorp.com/consul/1.8.0/consul_1.8.0_linux_amd64.zip

#unzip *.zip
#rm *.zip

#firewall-cmd --zone=public --permanent --add-port 8500/tcp
#firewall-cmd --zone=public --permanent --add-port 8600/udp
#export CONSUL_HTTP_SSL_VERIFY=false

consul agent -config-dir=/etc/consul.d -data-dir=/var/consul -node=client-1 -retry-join=${CONSUL_SERVER}
#sleep 30
#consul services register -name=cart
#consul services register -name=web
consul connect proxy -sidecar-for cart
#consul connect proxy -sidecar-for web