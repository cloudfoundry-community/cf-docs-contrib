#!/usr/bin/env bash
if [ -z "$CLOUDFOUNDRY_PASSWORD" ]; then
    echo "CLOUDFOUNDRY_PASSWORD must be set to david@davidlaing.com's cloudfoundry password "
    echo "==== Your current environment====="
    env
    exit 1
fi
gem install vmc
vmc target https://api.cloudfoundry.com
vmc login david@davidlaing.com --password $CLOUDFOUNDRY_PASSWORD
vmc push cf-docs-contrib