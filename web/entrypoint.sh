#!/usr/bin/env bash

#set -x

# echo "arg 1 $1"

BASE_DIR=/usr/share/nginx/html

if [ -n "$1" ]
then
    exec "$@"
fi


if [ -n "$INSTANA_EUM_KEY" -a -n "$INSTANA_EUM_REPORTING_URL" ]
then
    echo "Enabling Instana EUM"
    # use | instead of / as command delimiter to avoid eacaping the url
    sed -i "s|INSTANA_EUM_KEY|$INSTANA_EUM_KEY|" $BASE_DIR/eum-tmpl.html
    sed -i "s|INSTANA_EUM_REPORTING_URL|$INSTANA_EUM_REPORTING_URL|" $BASE_DIR/eum-tmpl.html
    cp $BASE_DIR/eum-tmpl.html $BASE_DIR/eum.html
else
    echo "EUM not enabled"
    cp $BASE_DIR/empty.html $BASE_DIR/eum.html
fi

# make sure nginx can access the eum file
chmod 644 $BASE_DIR/eum.html

# apply environment variables to default.conf
envsubst '${CATALOGUE_HOST} ${USER_HOST} ${CART_HOST} ${SHIPPING_HOST} ${PAYMENT_HOST} ${RATINGS_HOST}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx-debug -g "daemon off;"

#exec nginx-debug

# register consul-agent to the consul-server
#export CONSUL_HTTP_SSL_VERIFY=false

#consul agent -config-dir=/etc/consul.d -data-dir=/var/consul -node=web-1 -retry-join=${CONSUL_SERVER} &
#sleep 30
#consul services register -name=web
#consul connect proxy -sidecar-for web &






