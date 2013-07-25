#!/usr/bin/env bash
if [ -z "$CLOUDFOUNDRY_PASSWORD" ]; then
    echo "CLOUDFOUNDRY_PASSWORD must be set to david@davidlaing.com's cloudfoundry password "
    echo "==== Your current environment====="
    env
    exit 1
fi
gem install cf
cf target https://api.run.pivotal.io
cf login david@davidlaing.com --password $CLOUDFOUNDRY_PASSWORD
cf push cf-docs-contrib
