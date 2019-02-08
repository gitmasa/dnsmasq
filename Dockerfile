FROM centos:latest
MAINTAINER Masatoshi Eizono Tap
ENV baseDir /opt/
ENV dnsmasqDir dnsmasq_src
WORKDIR ${baseDir}
# WORKDIR /bar
COPY ./ /opt/dnsmasq_src
COPY ./dnsmasq.conf.example /opt/dnsmasq.conf
RUN yum install -y make gcc
RUN /bin/bash -c 'ls -la /opt;cd /opt/dnsmasq_src; make;mv /opt/dnsmasq_src/src/dnsmasq /opt/dnsmasq;rm -rf /opt/dnsmasq_src'
RUN yum remove -y make gcc cpp glibc-devel glibc-headers kernel-headers libgomp libmpc mpfr
CMD [ "/opt/dnsmasq", "--conf-file=/opt/dnsmasq.conf", "--port=53", "-k", "-u", "root" ]
