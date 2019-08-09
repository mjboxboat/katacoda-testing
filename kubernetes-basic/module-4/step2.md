
Now lets run the similar pods, but this time, we will use a DaemonSet.

The DaemonSet differs from a basic Deployment because it will only run 1 Pod on each host. No more, no less. More about DaemonSets here: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/

The Daemonset manifest file looks like this:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: http-daemonset
  labels:
    app: http-daemonset
spec:
  selector:
    matchLabels:
      app: http-daemonset
  template:
    metadata:
      labels:
        app: http-daemonset
    spec:
      tolerations:
        - effect: NoSchedule
          key: node-role.kubernetes.io/master
      containers:
      - name: http-daemonset
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

Notice that we removed the "replicas" section as this is not relevant to DaemonSets.

Also, we have added a "toleration" to allow this pod to the run on the master.

Let's run the Daemonset and inspect what we get after.

`kubectl apply -f ./resources/http-daemonset.yaml`{{execute}}

`kubectl get pods,daemonset`{{execute}}

We can see that without defining how many replicas to run, the Daemonset automatically recognized that there were 2 nodes (master and node01) and run 1 pod on each.