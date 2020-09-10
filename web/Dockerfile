FROM nginx:1.16

EXPOSE 8080

ENV CATALOGUE_HOST=catalogue.127.0.0.1.xip.io \
    USER_HOST=user \
    CART_HOST=cart.127.0.0.1.xip.io \
    SHIPPING_HOST=shipping \
    PAYMENT_HOST=payment \
    RATINGS_HOST=ratings

# Install supervisord

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

#RUN mkdir -p /etc/consul.d/

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY static /usr/share/nginx/html
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY bin/consul /usr/local/bin/consul
COPY config/web.json /etc/consul.d/web.json

COPY entrypoint.sh /root/
CMD ["/usr/bin/supervisord"]

