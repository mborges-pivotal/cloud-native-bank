#!/usr/bin/env bash
set -xe

cd pivotal-bank-demo/quotes-service
./gradlew build
cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf push  prod-quote --no-route
cf create-route "$CF_SPACE" "$CF_DOMAIN" --hostname prod-quote-"$CF_ORG"
cf map-route prod-quote "$CF_DOMAIN" --hostname prod-quote-"$CF_ORG"

set -xe

