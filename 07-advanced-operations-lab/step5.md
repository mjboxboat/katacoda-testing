Before we continue, let's remove the path based configuration

`kubectl delete -f ./resources/path-routing.yaml`{{execute}}

Assuming we have only one host (e.g. weighted.algo) and we want to route traffic to two different instances of the application without having to specify different URL or path.

For example, in a testing scenario, we want to allow a certain number of requests (e.g. 30%) to go to a "beta" version of the application (here called blue).
The rest of the requests should go to the "main" application (here called green)

We want to route traffic as follows (assuming port 80 and IP of worker):
- 30% of requests -> nginx-blue
- 70% of requests -> nginx-green
- no default

`kubectl apply -f ./resources/weighted-ingress.yaml`{{execute}}

At this stage we should see the ingress:
`kubectl get ingress`{{execute}}

The below script will curl the weighted.algo endpoint 10 times and should return approx 7 green and 3 blue.

`./resources/weighted-test.sh`{{execute}}