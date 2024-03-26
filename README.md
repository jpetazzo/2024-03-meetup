**Install operators:**

```
helmfile sync
```

**Create namespace:**

```
NAMESPACE=app
kubectl create namespace $NAMESPACE
kns $NAMESPACE
```

**Deploy database, message queue, and textsynth:**

```
kubectl apply -f postgres
kubectl apply -f rabbitmq
kubectl apply -f textsynth
# Ignore the warning about the Compose file :)
```

**Run Benthos processors:**

```
helmfile sync -f benthos/helmfile.yaml -n $NAMESPACE
```

**Check queue:**

```
kubectl exec mq-server-0 -- rabbitmqctl list_queues
```

**Check database:**

```
kubectl cnpg psql db -- messages -c "select * from messages;"
```

**Scale up textsynth and consumer:**

```
kubectl scale deployment consumer,textsynth --replicas 20
```

Wait for nodes to come up and queue to resorb a bit.

