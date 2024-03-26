#!/bin/sh
SERVER=localhost
hey -t 60 -m POST -n 4 -c 4  -d '{
"prompt": "If you visit San Francisco, I recommend that you",
"stop": "\n",
"temperature": 0.8
}' http://$SERVER:8020/v1/engines/mistral_7B_q4/completions
