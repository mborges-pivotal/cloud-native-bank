#!/usr/bin/env bash
set -xe

cd pivotal-bank-demo/web-ui
./gradlew build -x test
cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf push

set -xe

