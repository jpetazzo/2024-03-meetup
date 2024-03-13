#!/bin/bash


if [[ "$2" == "install" ]]; then

helm install -n benthos --create-namespace --version 2.1.1 -f values-benthos-${1}.yml  benthos-${1} benthos/benthos

else

helm upgrade -n benthos benthos-${1} benthos/benthos -f values-benthos-${1}.yml

fi
