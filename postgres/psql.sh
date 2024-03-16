#!/bin/sh
kubectl run --rm -it psql --image nixery.dev/shell/postgresql \
-- psql postgres://enix:password@db-rw/messages
