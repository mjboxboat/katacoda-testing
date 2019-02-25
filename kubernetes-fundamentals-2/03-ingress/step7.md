Now, we'll deploy path-based routing. Here are the rules for this configuration:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: path-ingress
spec:
  rules:
  - host: training.boxboat.io
    http:
      paths:
      - path: /tutum
        backend:
          serviceName: tutum-service
          servicePort: 80
    http:
      paths:
      - path: /jwilder
        backend:
          serviceName: jwilder-service
          servicePort: 8000
```

This is very similar to our previous set of rules, however, how we have a single host, `training.boxboat.io`. We now provide a `path` for **/tutum** and **/jwilder**. This will let us use a single URL and route traffic based on the actual path.

`kubectl create -f ./resources/nginx-path-ingress.yaml`{{execute}}

Now, we must update our entries in AWS Route53 so that `training.boxboat.io` resolves to our Load Balancer as well.

Now, we can access our applications:

[Tutum](https://training.boxboat.io/tutum)

[JWilder](https://training.boxboat.io/jwilder)

Do both of these work? Nope. Most apps are not configured to respond based on paths. Can anyone help me figure out why JWilder worked, but Tutum did not?