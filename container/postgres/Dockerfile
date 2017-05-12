FROM postgres:9.2-alpine

RUN apk --no-cache add openssl ca-certificates wget && update-ca-certificates

COPY Ambari-DDL-Postgres-CREATE.sql /tmp/Ambari-DDL-Postgres-CREATE.sql
COPY ambari-schema.sh /tmp/ambari-schema.sh

COPY postgres-setup.sh /docker-entrypoint-initdb.d/postgres-setup.sh