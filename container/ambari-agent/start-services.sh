#!/usr/bin/env bash

set -e

systemctl start ntpd.service

ambari-agent start