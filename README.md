First, install the operators and other singleton components (the stuff that only needs to be installed once, like the local volume provisioner). They'are all declared in the top-level helmfile:

```
helmfile sync
```

Then, install the database, message queue, and benthos producers and consumers. Note that these are going to be installed in the current namespace:

```
kubectl apply -f postgres
kubectl apply -f rabbitmq
helmfile sync -f benthos/helmfile.yaml
```

Enjoy!
