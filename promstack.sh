#!/bin/sh
helm upgrade --install promstack \
  --namespace promstack --create-namespace \
  --repo https://prometheus-community.github.io/helm-charts \
  kube-prometheus-stack --version 57.0.2 \
  #
