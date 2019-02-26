In this step we will create a Pod manifest (also called a Pod spec) using YAML. 

The following syntax will create a pod using the A.K.M.S. structure we discussed and you will then be able to deploy the pod using this file.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-nginx
  labels:
    app: web
spec:
  containers:
  - name: my-nginx
    image: nginx:latest
    ports:
      - containerPort: 80
```
We have already created this file for you, so you can view it by running `nano ./resources/pod.yaml`{{execute}}. Once you are done reviewing, you can exit by pressing `CTRL+X`.

Now, lets deploy the nginx pod using the file. `kubectl apply -f ./resources/pod.yaml`{{execute}}

Again, we can review if the Pod is running and view more information about the Pod using the following commands:
`kubectl get pods -o wide`{{execute}}
`kubectl describ pod nginx`{{execute}}

In the next step, we will see if we can access this pod both internally on the cluster an externally from the internet.