In this step we will deploy a Service that exposes the HTTP server pods externally using NodePort.

This step will make the service/pods accessible externally (outside of the cluster) on any of the primary IPs of any node in the cluster.

Follow along and enter the below service specification in the *service.yaml* file on the right.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: http-server-nodeport-service
spec:
  selector:
    app: http-server-nodeport
  type: NodePort
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30080
  sessionAffinity: None
```

Now let's apply the NodePort service file in Kubernetes.
- Deploy the service into k8s using the services.yaml file. `kubectl apply -f service.yaml`{{execute}}
- Check to make sure the service was deployed and what ClusterIP was assigned. `kubectl get svc -o wide`{{execute}}
- Run a curl against the ClusterIP shown for the http-server-service. `curl master:30080` {{execute}}
- Run the curl a few more times (press up arrow to show command again) and notice that each time you run it, a different pod behind the service responds.
- Lastly, lets access this externally in the web browser: https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/

You have now successfully deployed multiple pods and exposed them outside the cluster using NodePort. In the next section we will learn how to deploy a multi-service app and expose it externally.