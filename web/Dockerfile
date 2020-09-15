FROM nginx:1.16

EXPOSE 8080

ENV CATALOGUE_HOST=catalogue.127.0.0.1.xip.io \
    USER_HOST=user \
    CART_HOST=cart.127.0.0.1.xip.io \
    SHIPPING_HOST=shipping \
    PAYMENT_HOST=payment \
    RATINGS_HOST=ratings

# Install supervisord

RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
#mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

# set consul version
ENV CONSUL_VERSION 1.8.4

# download dependencies
RUN apt-get update && apt-get install -y ca-certificates wget unzip procps

# download and set up consul
RUN wget --quiet --output-document=/tmp/consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul.zip -d /usr/local/bin/ && \
    rm -f /tmp/consul.zip && \
    chmod +x /usr/local/bin/consul

#RUN mkdir -p /etc/consul.d/

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY static /usr/share/nginx/html
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

#COPY bin/consul /usr/local/bin/consul
COPY config/web.json /etc/consul.d/web.json

COPY entrypoint.sh /root/
CMD ["/root/entrypoint.sh"]
#CMD ["/usr/bin/supervisord"]

