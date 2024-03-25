#!/bin/sh
kubectl exec mq-server-0 -- rabbitmqctl list_queues
