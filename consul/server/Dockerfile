FROM consul
EXPOSE 8300
EXPOSE 8301
EXPOSE 8302
EXPOSE 8500
EXPOSE 8600/udp

COPY bck/server.json /consul/config/server.json
COPY certificates /consul/config/ssl/
COPY entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]

  "ca_file": "/consul/config/ssl/consul-agent-ca.pem",
  "cert_file": "/consul/config/ssl/dc1-server-consul-0.pem",
  "key_file": "/consul/config/ssl/dc1-server-consul-0-key.pem",