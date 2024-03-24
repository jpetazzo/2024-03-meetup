# TextSynth Server

This directory contains a Dockerfile to build an image to run TextSynth Server.
It allows to generate text completions using LLMs, for instance:

- *Prompt:* If you visit San Francisco, I recommend that you
- *Completion:* eat at a restaurant called Mama’s on Washington Square. It’s a little hole-in-the-wall that is only open for breakfast and lunch. It’s a great place to eat alone, and it’s also one of my favorite places in San Francisco.

## Running it on Kubernetes

```
kubectl apply -f textsynth.yaml
```

⚠️ The first time, it will download the `ts_server` binary and a Mistral LLM
(around 4 GB). The downloads will be cached in a `hostPath` volume.

Once it is running, you can test it with:

```
kubectl run --rm --attach --image fedora tsclient -- \
curl -fs http://textsynth:8020/v1/engines/mistral_7B_q4/completions -d '{
"prompt": "If you visit San Francisco, I recommend that you",
"stop": "\n",
"temperature": 0.8
}'
```

This should display something like:

```
{"text":" eat at a restaurant called Mama’s on Washington Square. It’s a little hole-in-the-wall that is only open for breakfast and lunch. It’s a great place to eat alone, and it’s also one of my favorite places in San Francisco.","reached_end":true,"finish_reason":"stop"}^C
```

