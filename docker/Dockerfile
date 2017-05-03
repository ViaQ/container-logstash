FROM centos:centos7
MAINTAINER The ViaQ Community <community@TBA>


ENV HOME=/opt/app-root/ \
    PATH=/opt/app-root/src/bin:/opt/app-root/bin:$PATH \
    LOGSTASH_VER=5.3.2 \
    JAVA_HOME=/usr/lib/jvm/jre \
    LS_HEAP_SIZE=512m \
	INSTANCE_RAM=4G

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    rpmkeys --import https://packages.elastic.co/GPG-KEY-elasticsearch

ADD logstash.repo /etc/yum.repos.d/logstash.repo

RUN yum update -y --setopt=tsflags=nodocs \
    && \
    yum install -y --setopt=tsflags=nodocs java-1.8.0-openjdk-headless \
    && \
    yum install -y --setopt=tsflags=nodocs \
        logstash \
    && \
    yum -y autoremove \
    && \
    yum clean all \
    && \
    /usr/share/logstash/bin/logstash-plugin install logstash-filter-translate

VOLUME /etc/logstash/conf.d

RUN  mkdir -p /etc/logstash/conf.d/ \
     && \
     chmod 775 ${HOME}

WORKDIR ${HOME}
ADD run.sh /usr/bin/
ADD logstash.yml log4j2.properties /etc/logstash/

USER 1001

CMD /usr/bin/run.sh
