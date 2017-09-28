# Role to provision logstash

## Provisioning

Run the role to provision `logstash` as a batch job.

## Deletion

Run the role, pass the variable `logstash_deploy=false` to the role to get
logstash wiped completely.

## Add your configuration to logstash

Define `configs_dir` as an absolute path to the configuration files.
Define `certs_dir` as an absolute path to the certificates and their private
keys.

### Configuration files
Add your configuration files to ``{{ configs_dir }}/conf.d``.
They will be presented in Logstash pod at `/etc/logstash/conf.d/`.

### Pattern files
Add your grok pattern files to `{{ configs_dir }}/pattern.d`.
They will be presented in Logstash pod at `/etc/logstash/pattern.d/`.

### Certificates
Add your certificate files to `{{ certs_dir }}/certs`.
They will be presented in Logstash pod at `/etc/pki/tls/certs/`.

### Certificate private keys
Add your certificate files to `{{ certs_dir }}/private-keys`.
They will be presented in Logstash pod at `/etc/pki/tls/private/`.
