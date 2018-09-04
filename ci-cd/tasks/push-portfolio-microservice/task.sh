#!/usr/bin/env bash
set -xe

cd pivotal-bank-demo/portfolio-service
./gradlew build -DskipTests
cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf push

set -xe

