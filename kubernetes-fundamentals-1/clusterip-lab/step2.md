First, lets write the PodSpec for a basic HTTP server pod.

In the file browser on the right, click the "clusterip-lab" directory and click to open both the "deployment.yaml" and "service.yaml" files.

**NOTE:** The editor here automatically saves changes to the files. You just need to enter the information and it will auto-save.

Below is the specification for the Deployment. Please follow along and enter the spec into the "deployment.yaml". 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: http-server
spec:
  selector:
    matchLabels:
      app: http-server
  replicas: 2
  template:
    metadata:
      labels:
        app: http-server
    spec:
      containers:
      - name: http-server
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

Now let's apply the deployment file in Kubernetes.
- Switch to the clusterip-lab directory `cd clusterip-lab`{{execute}}
- Deploy the HTTP server into k8s using the deployment file. `kubectl apply -f deployment.yaml`{{execute}}
- Check to make sure there are 2 HTTP pods running. `kubectl get pods -o wide`{{execute}}
- Lastly, lets check to make sure we can access the pods using curl.
  - `curl 10.32.0.4`{{execute}}
  - `curl 10.32.0.5`{{execute}}

Note that each pod has its own unique IP address and ID. These are the pods local IPs on the worker node they are running on. These IPs are only accessible from that node. To expose pods to other services within the cluster, you need a ClusterIP. In the next step we will deploy a service that leverages the ClusterIP.