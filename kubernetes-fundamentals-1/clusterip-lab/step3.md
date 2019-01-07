In this step we will deploy a Service that exposes the HTTP server pods using a ClusterIP.

This step will make the service/pods accessible on a single IP from anywhere within the cluster.

Follow along and enter the below service specification in the service.yaml file on the right.

```yaml
apiVersion: v1
kind: Service
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

Now let's apply the service file in Kubernetes.
- Deploy the service into k8s using the services.yaml file. `kubectl apply -f services.yaml`{{execute}}
- Check to make sure the service was deployed and what ClusterIP was assigned. `kubectl get svc -o wide`{{execute}}
- Run a curl against the ClusterIP shown for the http-server-service. `curl CLUSTERIP` (*you will need to type this manually using the clusterip of your specific service*)
- Run the curl again and notice that each time you run it, a different pod behind the service responds. `curl CLUSTERIP`.

You have now successfully deployed multiple pods and exposed them to the rest of the cluster using a ClusterIP. In the next section we will learn how to expose services/pods outside the cluster using NodePort.