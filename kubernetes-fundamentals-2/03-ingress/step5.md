Finally, we deploy our Ingress Rules. These are the first Kubernetes object that we have not already covered in detail. Here are the rules that we will deploy:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: name-virtual-host-ingress
spec:
  rules:
  - host: tutum.david.boxboat.io
    http:
      paths:
      - backend:
          serviceName: tutum-service
          servicePort: 80
  - host: jwilder.david.boxboat.io
    http:
      paths:
      - backend:
          serviceName: jwilder-service
          servicePort: 8000

```

These rules are configured for host-based routing. There are multiple entries in the rules for `host`. Any time the Ingress Controller receives requests, it will examine the headers for the destination of the packets. It will route those packets to the proper ClusterIP service based on the contents of those headers, and these rules.

For each `backend`, we configure `serviceName` which is the ClusterIP to route to, and `servicePort` which is the port that the ClusterIP service is configured to listen on.

Let's deploy the rules:

`kubectl create -f ./resources/nginx-ingress.yaml`{{execute}}