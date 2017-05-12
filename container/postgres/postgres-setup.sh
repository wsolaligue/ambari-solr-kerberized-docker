#!/usr/bin/env bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER ambari WITH PASSWORD 'ambari';
    CREATE DATABASE ambari;
    GRANT ALL PRIVILEGES ON DATABASE ambari TO ambari;
    \\connect ambari;
    CREATE SCHEMA ambari AUTHORIZATION ambari;
    ALTER SCHEMA ambari OWNER to AMBARI;
    ALTER ROLE ambari SET search_path to 'ambari', 'public';
EOSQL