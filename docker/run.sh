#!/bin/sh

set -e
set -x

ES_HOST=${ES_HOST:-elasticsearch}
ES_PORT=${ES_PORT:-80}
LOGSTASH_PREFIX=${LOGSTASH_PREFIX:-viaq-openshift-v2016.05.16.1}
NORMALIZER_NAME=${NORMALIZER_NAME:-logstash-container}
NORMALIZER_HOSTNAME=${NORMALIZER_HOSTNAME:-my-centos}
NORMALIZER_IP=${NORMALIZER_IP}
LISTEN_PORT=${LISTEN_PORT:-9999}

if [ "$DEBUG_LOGSTASH" = true ]; then
    LOGSTASH_ARGS="--debug"
else
    LOGSTASH_ARGS=""
fi

find /etc/logstash/conf.d -name \*.conf -exec sed -i \
        -e "s/%ES_HOST%/$ES_HOST/g" -e "s/%ES_PORT%/$ES_PORT/g" \
        -e "s/%SYSLOG_LISTEN_PORT%/$SYSLOG_LISTEN_PORT/g" \
        -e "s/%LOGSTASH_PREFIX%/$LOGSTASH_PREFIX/g" \
        -e "s/%NORMALIZER_NAME%/$NORMALIZER_NAME/g" -e "s/%NORMALIZER_IP%/$NORMALIZER_IP/g" \
        -e "s/%NORMALIZER_HOSTNAME%/$NORMALIZER_HOSTNAME/g" \
        -e "s/%LISTEN_PORT%/$LISTEN_PORT/g" \
        {} \;

/opt/logstash/bin/logstash agent ${LOGSTASH_ARGS} --config /etc/logstash/conf.d/

