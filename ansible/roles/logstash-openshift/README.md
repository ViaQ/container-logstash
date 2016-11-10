# Role to provision logstash

The role isn't idempotent at the moment.

## Provisioning

Run the role to provision `logstash`.

## Deletion

Run the role, pass the variable `logstash_deploy=false` to the role to get
logstash wiped completely.

## Add your configuration to logstash

Add your configuration files to [{{ role_path }}/files/conf.d](files/conf.d).
They will be presented in Logstash pod at `/etc/logstash/conf.d/`.
