FROM node:10

ENV CONSUL_SERVER=consul-server \
    INSTANA_AUTO_PROFILE=false

EXPOSE 8080

# set consul version
ENV CONSUL_VERSION 1.8.4

# download dependencies
RUN apt-get update && apt-get install -y ca-certificates wget unzip

# download and set up consul
RUN wget --quiet --output-document=/tmp/consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul.zip -d /usr/local/bin/ && \
    rm -f /tmp/consul.zip && \
    chmod +x /usr/local/bin/consul

WORKDIR /opt/server

COPY package.json /opt/server/

RUN npm install

#COPY bin/consul /usr/local/bin/consul
COPY server.js /opt/server/

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]

