FROM centos:7

RUN yum install -y wget ntp unzip
RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.0.3/ambari.repo -O /etc/yum.repos.d/ambari.repo

################ REMOVE
COPY HDP.repo /etc/yum.repos.d/HDP.repo
COPY HDP-UTILS.repo /etc/yum.repos.d/HDP-UTILS.repo
#################################3

RUN yum install -y ambari-agent
RUN sed -i'' -e 's/localhost/ambari/' /etc/ambari-agent/conf/ambari-agent.ini

################# REMOVE
RUN yum install -y hdp-select
RUN yum install -y zookeeper_2_6_0_3_8 zookeeper_2_6_0_3_8-server
#################

RUN adduser solr

############### REMOVE - SHOULD BE DOWNLOADED FROM JENKINS
COPY lucidworks-hdpsearch-2.6.1-2.noarch.rpm /tmp/lucidworks-hdpsearch-2.6.1-2.noarch.rpm
RUN rpm -Uvh /tmp/lucidworks-hdpsearch-2.6.1-2.noarch.rpm

#COPY krb5.conf /etc/krb5.conf

COPY jdk-8u112-linux-x64.tar.gz /tmp/jdk-8u112-linux-x64.tar.gz
COPY jce_policy-8.zip /tmp/jce_policy-8.zip

RUN tar -zxvf /tmp/jdk-8u112-linux-x64.tar.gz -C /tmp

RUN mkdir -p /usr/jdk64/
RUN mv /tmp/jdk1.8.0_112 /usr/jdk64
RUN unzip -o -j -q /tmp/jce_policy-8.zip -d /usr/jdk64/jdk1.8.0_112/jre/lib/security/

COPY start-services.sh /tmp/start-services.sh

CMD ["/usr/sbin/init"]