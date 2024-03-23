#!/bin/bash


kubectl port-forward -n v2 service/benthos-api 8888:8080 &

