FROM centos:7

RUN yum -y install krb5-server krb5-libs krb5-workstation ntp

COPY krb5.conf /etc/krb5.conf
COPY kadm5.acl /var/kerberos/krb5kdc/kadm5.acl
COPY kdc.conf /var/kerberos/krb5kdc/kdc.conf

RUN kdb5_util create -r KDC.COM -d /var/kerberos/krb5kdc/principal -P admin -s
RUN kadmin.local -q "add_principal -pw admin admin/admin"

COPY start-services.sh /tmp/start-services.sh

CMD ["/usr/sbin/init"]