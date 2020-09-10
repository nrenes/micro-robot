FROM node:10

ENV INSTANA_AUTO_PROFILE=-true \
    CONSUL_SERVER=consul-server

# Install supervisord

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

EXPOSE 8080 9191

WORKDIR /opt/server

COPY package.json /opt/server/

RUN npm install

COPY bin/consul /usr/local/bin/consul
COPY config/*.json /etc/consul.d/
COPY server.js /opt/server/
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]


