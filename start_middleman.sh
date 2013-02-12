#!/usr/bin/env bash
if [ -z "$VCAP_APP_PORT" ]; then
    echo "VCAP_APP_PORT must be set to the port you want to run middleman on."
    echo "==== Your current environment====="
    env
    exit 1
fi
env
middleman server --port $VCAP_APP_PORT
