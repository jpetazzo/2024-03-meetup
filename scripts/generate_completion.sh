#!/bin/sh
SERVER=textsynth
kubectl run --rm --attach --image fedora tsclient -- \
curl -fs http://$SERVER:8020/v1/engines/mistral_7B_q4/completions -d '{
"prompt": "If you visit San Francisco, I recommend that you",
"stop": "\n",
"temperature": 0.8
}'
