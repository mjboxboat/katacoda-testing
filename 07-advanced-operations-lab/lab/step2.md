Right now, we have a Kubernetes cluster running, with an couple of "applications" running and a traefik service that we can use to route requests.

Let's assume two hostnames:
- blue.algo
- green.algo

We want to route traffic as follows (assuming port 80):
- blue.algo -> nginx-blue
- green.algo -> nginx-green
- IP of worker -> nginx-default

`kubectl apply -f ./resources/host-routing.yaml`{{execute}}

At this stage we should see the ingress:
`kubectl get ingress`{{execute}}

We can see the blue.algo and green.algo hosts listed there.

Click this link to see if the default host route is working: https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

Because of the way the training environment works, we cannot access blue and green from a browser as host names, but we can in the terminal. Run each command below and look for the "deployment

`curl blue.algo | grep blue`{{execute}}
`curl green.algo | grep green`{{execute}}