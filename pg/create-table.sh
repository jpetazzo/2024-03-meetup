#!/bin/bash

kubectl port-forward -n db service/db01-rw 5432:5432 &
psql -h 127.0.0.1 -U enix -d messages -c "CREATE TABLE messages (id varchar(50), message varchar(255), hostname varchar(50));"
