#!/bin/sh
echo "Purging queue..."
kubectl exec mq-server-0 -- rabbitmqctl purge_queue q1
echo "Purging database..."
kubectl cnpg psql db -- messages -c "DELETE FROM messages;"
