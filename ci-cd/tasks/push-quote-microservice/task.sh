#!/usr/bin/env bash
set -xe

cd pivotal-bank-demo/quotes-service
./gradlew build
cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf push  prod-quote --no-route
cf create-route "$CF_SPACE" cfapps.haas-115.pez.pivotal.io --hostname prod-quote-"$CF_ORG"
cf map-route prod-quote cfapps.haas-115.pez.pivotal.io --hostname prod-quote-"$CF_ORG"

set -xe

