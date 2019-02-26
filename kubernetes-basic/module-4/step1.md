Welcome to the BoxBoat "Kubernetes Training" Basics series. This is Module 4, Kubernetes Deployments. In this lab we will cover the different types of deployments.

It is important to note that Deployments leverage and automatically create "ReplicaSets" and use these to automatically restart pods if they crash as well an maintain the desired number of pods.

More about ReplicaSets and Deployments:
Deployments: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
ReplicaSets: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/

Replicasets can be managed outside of deployments, but that is outside the scope of this training.

There are 3 basic types of deployments. `Deployment`, `DaemonSet` and `StatefulSet`.

In this next step, we will show standard Deployment file written in YAML and how we can interact with this deployment.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tutum-deployment
  labels:
    app: tutum
spec:
  replicas: 2
  selector:
    matchLabels:
      app: tutum
  template:
    metadata:
      labels:
        app: tutum
    spec:
      containers:
      - name: tutum
        image: tutum/hello-world
        ports:
        - containerPort: 80
```
This is a basic Deployment file and that includes the additional instructions to run a ReplicaSet of 2 pods.

Let's deploy this pod from the pre-created manifest file and then see all of the components that were created.
`kubectl apply -f ./resources/tutum-deployment.yaml`{{execute}}

`kubectl get pods,deploy,rs`{{execute}}

Notice that a pod, a deployment and a replicaset were all created from that one file.
