FROM mongo:latest

ENV CONSUL_SERVER=consul-server

COPY *.js /docker-entrypoint-initdb.d/

# set consul version
ENV CONSUL_VERSION 1.8.4

# download dependencies
RUN apt-get update && apt-get install -y ca-certificates wget unzip

# download and set up consul
RUN wget --quiet --output-document=/tmp/consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul.zip -d /usr/local/bin/ && \
    rm -f /tmp/consul.zip && \
    chmod +x /usr/local/bin/consul
#COPY bin/consul /usr/local/bin/consul
COPY config/mongodb.json /etc/consul.d/mongodb.json

COPY docker-entrypoint.sh /usr/local/bin/

#ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]