#!/bin/bash

helm repo add kedacore https://kedacore.github.io/charts
helm repo add benthos https://benthosdev.github.io/benthos-helm-chart/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm install -n keda --create-namespace -f values-keda.yml keda kedacore/keda
helm install rabbitmq -n system-rabbitmq --create-namespace  bitnami/rabbitmq-cluster-operator

