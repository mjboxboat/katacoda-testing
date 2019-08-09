Before we continue, let's remove the host based configuration

`kubectl delete -f ./resources/host-routing.yaml`{{execute}}

Assuming we don't want to configure multiple DNS entries for the applications, we have another solution to split traffic: path based.

We want to route traffic as follows (assuming port 80 and IP of worker):
- IP/blue -> nginx-blue
- IP/green -> nginx-green
- IP of worker -> nginx-default

`kubectl apply -f ./resources/path-routing.yaml`{{execute}}

At this stage we should see the ingress:
`kubectl get ingress`{{execute}}

Path routing works in this environment, so click the links below and note the "Server Name" for each.

Default: https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/
Blue: https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/blue
Green: https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/green