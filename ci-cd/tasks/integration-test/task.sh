#!/usr/bin/env bash
set -xe

cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf apps
cf services
cf curl "/v2/apps?q=organization_guid:$(cf org "$CF_ORG" --guid)"

set -xe

