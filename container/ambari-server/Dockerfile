FROM centos:7

USER root
RUN yum install -y wget nmap-ncat krb5-workstation ntp unzip
RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.0.3/ambari.repo -O /etc/yum.repos.d/ambari.repo
RUN yum install -y ambari-server

COPY deploy-ambari-server.sh /tmp/deploy-ambari-server.sh

COPY krb5.conf /etc/krb5.conf

########## REMOVE ##################
COPY jdk-8u112-linux-x64.tar.gz /var/lib/ambari-server/resources
COPY jce_policy-8.zip /var/lib/ambari-server/resources

RUN tar -zxvf /var/lib/ambari-server/resources/jdk-8u112-linux-x64.tar.gz -C /tmp

RUN mkdir -p /usr/jdk64/
RUN mv /tmp/jdk1.8.0_112 /usr/jdk64
RUN unzip -o -j -q /var/lib/ambari-server/resources/jce_policy-8.zip -d /usr/jdk64/jdk1.8.0_112/jre/lib/security/

########## GENERATE BY USING GIT AND GRADLE ##################
COPY solr-service-mpack-3.0.0.tar.gz /tmp/solr-service-mpack-3.0.0.tar.gz

COPY blueprint/ /tmp/blueprint/

CMD ["/usr/sbin/init"]