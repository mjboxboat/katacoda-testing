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

Below is the Service spec for the 

```yaml
kind: Service
apiVersion: v1
metadata:
  name: http-server-service
spec:
  selector:
    app: http-server
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
```