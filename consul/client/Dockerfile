FROM consul

ENV INSTANA_AUTO_PROFILE=-true \
    CONSUL_SERVER=consul-server

COPY config /etc/consul.d/

COPY entrypoint.sh /root/
COPY certificates /consul/config/ssl/
ENTRYPOINT ["/root/entrypoint.sh"]