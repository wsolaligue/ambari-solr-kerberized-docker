#!/usr/bin/env bash

set -e

curl -i -uadmin:admin -H 'X-Requested-By: ambari' -X POST http://localhost:8080/api/v1/blueprints/solr_kerberized -d @/tmp/blueprint/blueprint.json

curl -i -uadmin:admin -H 'X-Requested-By: ambari' -X POST http://localhost:8080/api/v1/clusters/cluster_solr_kerberized -d @/tmp/blueprint/host_mapping.json