#!/usr/bin/env bash
set -xe

cf api $CF_API --skip-ssl-validation
cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
cf apps
cf services

curl -k https://"$CF_SPACE"-web-"{$CF_ORG},{$DOMAIN}"
curl -k https://"$CF_SPACE"-accounts-"{$CF_ORG},{$DOMAIN}"
curl -k https://"$CF_SPACE"-quote-"{$CF_ORG},{$DOMAIN}"
curl -k https://"$CF_SPACE"-user-"{$CF_ORG},{$DOMAIN}"
curl -k https://"$CF_SPACE"-portfolio-"{$CF_ORG},{$DOMAIN}"

echo "All production services are up and green!! :)"
set -xe

