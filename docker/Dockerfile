FROM centos:centos7
MAINTAINER The ViaQ Community <community@TBA>


ENV HOME=/opt/app-root/src \
    PATH=/opt/app-root/src/bin:/opt/app-root/bin:$PATH \
    JAVA_HOME=/usr/lib/jvm/jre

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    rpmkeys --import https://packages.elastic.co/GPG-KEY-elasticsearch

ADD logstash.repo /etc/yum.repos.d/logstash.repo

RUN yum update -y --setopt=tsflags=nodocs \
    && \
    yum install -y --setopt=tsflags=nodocs java-1.8.0-openjdk \
    && \
    yum install -y --setopt=tsflags=nodocs \
        logstash \
    && \
    yum -y autoremove \
    && \
    yum clean all

VOLUME /etc/logstash/conf.d

RUN  mkdir -p /etc/logstash/conf.d/

WORKDIR ${HOME}
ADD run.sh /usr/bin/

USER 1001
CMD /usr/bin/run.sh
