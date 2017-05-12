#!/usr/bin/env bash

set -e

systemctl start ntpd.service

ambari-server setup --database=postgres --databasehost=postgres --databaseport=5432 --databasename=ambari --postgresschema=ambari --databaseusername=ambari --databasepassword=ambari -s -v

export PGPASSWORD='ambari'

psql -v ON_ERROR_STOP=1 -h postgres -p 5432 --username "ambari" <<-EOSQL
    \\connect ambari;
    update metainfo set metainfo_value='2.5.0.3' where metainfo_key='version';
EOSQL

ambari-server install-mpack --mpack=/tmp/solr-service-mpack-3.0.0.tar.gz -v

ambari-server start