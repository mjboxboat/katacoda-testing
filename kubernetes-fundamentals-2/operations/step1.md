First, let's use everything we've learned so far to create a simple Nginx Deployment and Service so that we can access it. We'll run a pretty vanilla version of Nginx, and create a NodePort Service so we can access it on the hosts. We'll also specify a NodePort so it is easier to access.

Here's the scaffolding for our Deployment. You can find this file at `./resources/nginx-deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ??
spec:
  selector:
    matchLabels:
      ??: ??
  replicas: 5
  template:
    metadata:
      labels:
        ??: ??
    spec:
      containers:
      - name: nginx
        image: ??
        ports:
        - containerPort: ??
```

Remember, Kubernetes Manifest files tend to have a lot of boilerplate. At this point, what are we missing? Who can help fill in the blanks?

Once we've got our Deployment file ready to go, let's have Kubernetes create all of the appropriate objects:

`kubectl create -f ./resources/nginx-deployment.yaml`{{execute}}

Let's make sure that our Deployment is running successfully:

`kubectl get deployments`{{execute}}

Remember, it may take a few seconds to start up and schedule all Pods.

Now that we've got our Deployment up and running, let's create a NodePort Service so we can access it. Here is the boilerplate to start it off (`./resources/nginx-service.yaml`), can anyone help me finish it?

```yaml
apiVersion: v1
kind: Service
metadata:
  name: ??
  labels:
    ??: ??
spec:
  type: NodePort
  selector:
    ??: ??
  ports:
   - port: ??         # Port other Pods use within the cluster to access the service
     targetPort: ??   # Port that the Pod is listening on
     nodePort: ??     # Port to expose on all nodes in the cluster
```

Now that we've got our Service file ready to go, let's deploy it:

`kubectl create -f ./resources/nginx-service.yaml`{{execute}}

Let's verify that the Service was created successfully:

`kubectl get services`{{execute}}

Now, we can verify that we can actually access Nginx.