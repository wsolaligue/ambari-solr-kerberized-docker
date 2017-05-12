#!/usr/bin/env bash

set -e

systemctl start ntpd.service
systemctl start krb5kdc.service
systemctl start kadmin.service