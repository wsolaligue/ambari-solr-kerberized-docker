#!/usr/bin/env bash

set -e

docker-compose down -v

docker-compose up -d

echo "============== START SERVICES ON KERBEROS SERVER =============="
docker-compose exec kerberos bash -c "sh /tmp/start-services.sh"

echo "====================== WAIT FOR POSTGRES ======================"
docker-compose exec postgres bash -c "until nc -w 2 postgres 5432 </dev/null 2>/dev/null; do sleep 1; done"

echo "=================== AMBARI SCHEMA ON POSTGRES ================="
docker-compose exec postgres bash -c "sh /tmp/ambari-schema.sh"

echo "========================= DEPLOY AMBARI ======================="
docker-compose exec ambari bash -c "sh /tmp/deploy-ambari-server.sh"

echo "======================= WAIT FOR AMBARI ======================="
echo "===================== WAIT FOR PORT 8080 ======================"
docker-compose exec ambari bash -c "until nc -w 2 ambari 8080 </dev/null 2>/dev/null; do sleep 1; done"
echo "===================== WAIT FOR PORT 8440 ======================"
docker-compose exec ambari bash -c "until nc -w 2 ambari 8440 </dev/null 2>/dev/null; do sleep 1; done"

echo "========================= START HOST1 ========================="
docker-compose exec host1 bash -c "sh /tmp/start-services.sh"

echo "========================= START HOST2 ========================="
docker-compose exec host2 bash -c "sh /tmp/start-services.sh"

echo "========================= START HOST3 ========================="
docker-compose exec host3 bash -c "sh /tmp/start-services.sh"

echo "======================== DEPLOY CLUSTER ======================="
docker-compose exec ambari bash -c "sh /tmp/blueprint/blueprint.sh"