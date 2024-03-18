#!/bin/sh
URI="$(kubectl get secrets db-app -o json | jq -r .data.uri | base64 -d)"
kubectl run --rm -it psql --image nixery.dev/shell/postgresql \
-- psql $URI
