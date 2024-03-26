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
kubectl scale deployment consumer,textsynth --replicas 100
```

This should trigger node autoscaling. It will take a few
minutes for the new nodes to come up. Wait a bit. Eventually,
the queue should start to come down. Yay!

But if we look with `kubectl top pods`, many of these pods
are idle. We have overprovisioned textsynth. Let's try to
do better with autoscaling.

**Enable autoscaling on textsynth:**

```
kubectl autoscale deployment textsynth --max=100
```

Now we wait a bit. After a few minutes, textsynth should be
scaled down until we reach a kind of "cruise speed" where we
have "just the right amount" of textsynth pods to handle the
load.

But... If we look with `kubectl top pods` again, we'll see
that some pods are still idle. This is because of unfair load
balancing. We're going to change that by having exactly
one textsynth pod per benthos consumer, and have each benthos
consumer talk to its "own" textsynth. We'll achieve that by
running textsynth as a sidecar right next to the benthos
consumer.

**Switch to sidecar architecture and KEDA autoscaler:**

```
helmfile sync -f benthos/helmfile.yaml -n $NAMESPACE -e sidecar
```

This will scale according to the queue depth, and it should
also stabilize after a while.

Check the results:

```
kubectl get so,hpa,deploy
```

After a while the number of nodes should also go down on its own.
