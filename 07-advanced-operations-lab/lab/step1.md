Welcome to the BoxBoat Bootcamp! For this lab we will need to install [Traefik - The Cloud Native Edge Router]
(https://traefik.io/).

We will learn how to use the Traefik edge router as an ingress controller for host/path based routing and traffic shaping.

We have configuration files for labs in `./resources/`. These will deploy the RBAC, DaemonSet and the Ingress.

Let's begin.

First we need to configure authorization using RBAC

`kubectl apply -f ./resources/traefik-rbac.yaml`{{execute}}

Second we deploy Traefik container
`kubectl apply -f ./resources/traefik-daemonset.yaml`{{execute}}

Finally we configure the ingress
`kubectl apply -f ./resources/traefik-webui.yaml`{{execute}}

You can check to make sure the Traefik dashboard is working here: https://[[HOST2_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Next we will deploy a sample nginx application consisting of three components:
- "default": which will be used as a default reply
- "green" and "blue": which will be used as alternative destinations, depending on rules

`kubectl apply -f ./resources/nginx-default.yaml`{{execute}}
`kubectl apply -f ./resources/nginx-blue.yaml`{{execute}}
`kubectl apply -f ./resources/nginx-green.yaml`{{execute}}


