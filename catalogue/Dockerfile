FROM node:10

ENV INSTANA_AUTO_PROFILE true

EXPOSE 8080 9292

# Install supervisord

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

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

COPY server.js /opt/server/
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#COPY bin/consul /usr/local/bin/consul
COPY config/catalogue.json /etc/consul.d/catalogue.json

CMD ["/usr/bin/supervisord"]

