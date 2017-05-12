#!/usr/bin/env bash

set -e

export PGPASSWORD='ambari'

psql -v ON_ERROR_STOP=1 --username "ambari" <<-EOSQL
    \\connect ambari;
    \i /tmp/Ambari-DDL-Postgres-CREATE.sql
EOSQL
