#!/bin/bash


kubectl port-forward -n prom-system service/promstack-grafana 8080:80 &
kubectl port-forward -n prom-system service/prometheus-operated 8081:9090 &
kubectl port-forward -n app service/mq 8082:15672 &
