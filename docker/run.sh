#!/bin/sh

set -e
set -x

# the amount of RAM allocated should be half of available instance RAM.
# ref. https://www.elastic.co/guide/en/elasticsearch/guide/current/heap-sizing.html#_give_half_your_memory_to_lucene
regex='^([[:digit:]]+)([GgMm])$'
if [[ "${INSTANCE_RAM}" =~ $regex ]]; then
	num=${BASH_REMATCH[1]}
	unit=${BASH_REMATCH[2]}
	if [[ $unit =~ [Gg] ]]; then
		((num = num * 1024)) # enables math to work out for odd gigs
	fi
	if [[ $num -lt 512 ]]; then
		echo "INSTANCE_RAM set to ${INSTANCE_RAM} but must be at least 512M"
		exit 1
	fi
	LS_HEAP_SIZE="$(($num/2))m"
else
    echo "INSTANCE_RAM env var is invalid: ${INSTANCE_RAM:-}"
    exit 1
fi

if [ "$DEBUG_LOGSTASH" = true ]; then
    LOGSTASH_ARGS="--config.debug --log.level trace"
else
    LOGSTASH_ARGS=""
fi

/usr/share/logstash/bin/logstash ${LOGSTASH_ARGS} --log.format json --path.config /etc/logstash/conf.d/ --path.data /opt/app-root/
