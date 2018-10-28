#!/usr/bin/env bash
set -xe

cd pivotal-bank-demo/web-ui
./gradlew build -x test
cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf push  prod-web --no-route
cf create-route "$CF_SPACE" "$CF_DOMAIN" --hostname prod-web-"$CF_ORG"
cf map-route prod-web "$CF_DOMAIN" --hostname prod-web-"$CF_ORG"


set -xe

