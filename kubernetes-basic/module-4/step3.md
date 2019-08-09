In the last section we will check out the StatefulSet deployment type.

Like a Deployment , a StatefulSet manages Pods that are based on an identical container spec. Unlike a Deployment, a StatefulSet maintains a sticky identity for each of their Pods. These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling.

More info on StatefulSets here: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/

Let's see what a StatefulSet manifest file looks like.

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: http-statefulset
  labels:
    app: http
spec:
  selector:
    matchLabels:
      app: http-statefulset
  serviceName: "http-statefulset"
  replicas: 3
  template:
    metadata:
      labels:
        app: http-statefulset
    spec:
      containers:
      - name: http-statefulset
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

We can see that this is almost exactly the same as the Deployment spec with just the "kind" being different.

Let's deploy the StatefulSet and see it differs from the standard Deployment.

`kubectl apply -f ./resources/http-statefulset.yaml`{{execute}}

`kubectl get pods,sts,svc`{{execute}}

Notice that the pods are created with the podname-0, podname-1, etc moniker. This is unique about statefulsets. If you still have your standard deployment pods running, you can see that those have a unique hash after the base Pod name. Even if destroyed, the Statefulset pods will retain that name when they are recreated. This comes in handy when running stateful applications that cannot tolerate random Pod naming.

Also, the DaemonSet type brings up Service creation to address the pods.

This completes Module 4. In Module 5, we will cover exposing Pods via Kubernetes Services.

Visit the BoxBoat blog for more Kubernetes and DevOps content: https://boxboat.com/blog/
