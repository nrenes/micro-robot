FROM mongo:3.6.1

ENV CONSUL_SERVER=consul-server

COPY *.js /docker-entrypoint-initdb.d/
COPY bin/consul /usr/local/bin/consul
COPY config/mongodb.json /etc/consul.d/mongodb.json

COPY docker-entrypoint.sh /usr/local/bin/

#ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]