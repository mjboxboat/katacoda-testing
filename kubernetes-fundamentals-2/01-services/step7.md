Next, we will deploy a game called [Hextris](http://hextris.io/).

## Deployment

First we will create a deployment manifest. The deployment is relatively simple.
Create your base file: `touch ./resources/hextris.yaml`{{execute}}

Edit this file and configure the following values, in addition to everything else
necessary to create a Deployment:

1. replicas = 1
2. image = `boxboat/hextris`
4. container port = 80

There are many more scaffolding requirements for this Deployment, such as
`apiVersion`. Refer back to your notes, and you may need to check out what
you've previously done in the Pod lab. You can find old files that you've
previously worked on in the `/old/` directory on this host.

When the deployment file is complete, create the deployment:

`kubectl apply -f hextris.yaml`{{execute}}

## Service

Once you've deployed the Hextris server, create a Service so it is reachable
from the outside world. To do this, create a service, and verify that everything
is working correctly.

`touch ./resources/hextris-service.yaml`{{execute}}

After creating the service file contents, create the service:

`kubectl apply -f hextris-service.yaml`{{execute}}

List the services, note the external port, then click the following link and
enter the external port:

https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/

## Conclusion

Deploying applications is really easy with Kubernetes. If any of you have
software running on a server in your home, I can almost guarantee someone is
currently maintaining a Deployment Manifest for it on GitHub.
