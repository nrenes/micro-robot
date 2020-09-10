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
#consul agent -server -bootstrap -ui -config-dir /consul/config -client=0.0.0.0
consul agent -server -ui -config-dir /consul/config -node=server-1 -bootstrap-expect=1 -client=0.0.0.0

#consul connect proxy -sidecar-for cart

#-config-dir /config
#consul agent -server -ui -node=server-1 -bootstrap-expect=1 -client=0.0.0.0 -data-dir /tmp/consul