Next, we'll deploy a Load Balancer Service. Remember, this will allocate a LoadBalancer in our cloud environment, configure a NodePort, and a ClusterIP. Here is what the configuration looks like:

```yaml
kind: Service
apiVersion: v1
metadata:
  name: ingress-nginx
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
spec:
  externalTrafficPolicy: Local
  type: LoadBalancer
  selector:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
  ports:
    - name: http
      port: 80
      targetPort: http
    - name: https
      port: 443
      targetPort: https
```

`targetPort` in this instance is based on the name of the port that the Service will serve traffic to. This LoadBalancer serves traffic to the `ingress-nginx` Deployment, so `http` and `https` are defined and used from that configuration.

Let's deploy the Load Balancer:

`kubectl create -f ./resources/cloud-generic.yaml`{{execute}}