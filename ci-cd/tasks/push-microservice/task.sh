#!/usr/bin/env bash
set -xe

NAME=quote-prod
CF_ORG=pivot-mborges
CF_USER=mborges@pivotal.io
CF_SPACE=prod
CF_PWD=CHANGEME

# https://community.pivotal.io/s/article/How-to-get-the-Bearer-Token-of-Elastic-Runtime-Client-via-REST-API
curl 'https://uaa.run.pcfbeta.io/oauth/token' -i -X POST \
 -H 'Content-Type: application/x-www-form-urlencoded' \
 -H 'Accept: application/json' \
 -d 'client_id=<CLIENT_ID>&client_secret=<CLIENT_SECRET>&grant_type=client_credentials&token_format=bearer&response_type=token' -k

curl -v -XPOST -H"Application/json" -u "cf:" --data "username=<username>&password=<password>&client_id=cf&grant_type=password&response_type=token" https://login.run.pivotal.io/oauth/token

#cd pivotal-bank-demo/quotes-service
#./gradlew build

if [ "true" = "$CF_SKIP_SSL" ]; then
  cf api $CF_API --skip-ssl-validation
else
  cf api $CF_API
fi

HOSTNAME="${NAME}-${CF_ORG}"

cf login -u $CF_USER -p $CF_PWD -o $CF_ORG -s $CF_SPACE
#cf push  $NAME --no-route
#cf create-route "$CF_SPACE" $CF_API --hostname ${HOSTNAME}
#cf map-route $NAME $CF_API --hostname $HOSTNAME

set -xe

