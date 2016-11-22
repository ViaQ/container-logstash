#!/bin/sh

set -e
set -x

if [ "$DEBUG_LOGSTASH" = true ]; then
    LOGSTASH_ARGS="--debug"
else
    LOGSTASH_ARGS=""
fi

/opt/logstash/bin/logstash agent ${LOGSTASH_ARGS} --config /etc/logstash/conf.d/

