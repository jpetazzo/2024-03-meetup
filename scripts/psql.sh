#!/bin/sh
URI="$(kubectl get secrets db-app -o json | jq -r .data.uri | base64 -d)"
kubectl run --rm -it psql --image postgres:alpine \
-- psql -P pager=off $URI "$@"
