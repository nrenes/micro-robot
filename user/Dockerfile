FROM node:10

ENV CONSUL_SERVER=consul-server \
    INSTANA_AUTO_PROFILE=true

EXPOSE 8080

WORKDIR /opt/server

COPY package.json /opt/server/

RUN npm install

COPY bin/consul /usr/local/bin/consul
COPY server.js /opt/server/

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]

