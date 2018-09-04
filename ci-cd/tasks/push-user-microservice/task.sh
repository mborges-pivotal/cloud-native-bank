#!/usr/bin/env bash
set -xe

cd pivotal-bank-demo/user-service
./gradlew build -x test
cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf push  prod-user --no-route
cf create-route "$CF_SPACE" cfapps.haas-115.pez.pivotal.io --hostname prod-user-"$CF_ORG"
cf map-route prod-user cfapps.haas-115.pez.pivotal.io --hostname prod-user-"$CF_ORG"

set -xe

