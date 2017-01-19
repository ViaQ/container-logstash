#!/bin/sh

set -e
set -x

if [ "$DEBUG_LOGSTASH" = true ]; then
    LOGSTASH_ARGS="--config.debug --log.level trace"
else
    LOGSTASH_ARGS=""
fi

/usr/share/logstash/bin/logstash ${LOGSTASH_ARGS} --log.format json --path.config /etc/logstash/conf.d/ --path.data /opt/app-root/

