# docker-logstash
ViaQ Logstash docker container - implements the aggregator/formatter

## Environmental variables:
`ES_HOST` must be FQDN of ElasticSearch server.  
`ES_PORT` must be the port on which the ElasticSearch server is listening.  
`LISTEN_PORT` the port this rsyslog instance is listening for. both TCP and UDP.  

## External Logstash config
In order to add own Fluentd configuration file please add the configuration files to a local directory and map in to `/data` docker volume.  
The following files are taken form the local directory:  
`fluent.conf, config.d/*, patterns.d/*`  
In case `fluent.conf` exists, the default `config.d/*.conf` is removed and not used in the container.

## Running:
* Specify the environmental variables
* execute `run-container.sh`


