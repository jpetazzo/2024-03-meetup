#!/bin/sh
echo "Purging queue..."
kubectl exec mq-server-0 -- rabbitmqctl purge_queue q1
echo "Purging database..."
URI="$(kubectl get secrets db-app -o json | jq -r .data.uri | base64 -d)"
kubectl run --rm -it psql --image postgres:alpine \
-- psql -P pager=off $URI -c "DELETE FROM messages;"
