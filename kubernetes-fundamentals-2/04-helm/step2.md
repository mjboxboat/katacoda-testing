Now that we have Helm installed, lets install an application!

## Finding a chart
The list of helm charts is extensive. They are developed at [github.com/helm/charts](https://github.com/helm/charts). We can see all the remote charts that are available to us by doing a search:

`helm search`{{execute}}

All of the charts we are seeing come from the preconfigured "stable" repository. We can see the configured repositories using:

`helm repo list`{{execute}}

For this lab, we will be using the tomcat chart.

`helm search tomcat`{{execute}}

## Installing a chart

To install a chart you must specify a path to that chart. Referencing `stable/tomcat` means that we are going to pull tomcat from the preconfigured "stable" repository. We are also specifying that we will install version `0.2.0` of the chart.

`helm install --name sample  stable/tomcat --version 0.2.0`{{execute}}

Thats it! Tomcat is deploying.

## Investigating the objects
This helm chart created a service, a deployment, and a pod.

Notice that the service is of type `LoadBalancer`. In the next section we will discuss this.

`kubectl get services`{{execute}}

As we can see by looking at the deployment, a single replica was created.

`kubectl get deployments`{{execute}}

The pod can take a bit of time to come up. You can `describe` it to see how it was configured.

`kubectl get pods`{{execute}}

## Access the service
Once the Tomcat pod is running, lets make sure that it is working.

Since the NodePort was automatically assigned, we must get its value to access the service. To get the node port, run:

`PORT=$(kubectl get svc sample-tomcat -o=jsonpath={.spec.ports[0].nodePort})`{{execute}}

The webarchive that is pulled by default responds to `/sample/`. To test this, run:

`curl -L node01:${PORT}/sample`{{execute}}

## Clean up
Lets remove this release we installed. By specifying `--purge`, we free up the "sample" release name for future use.

`helm delete --purge sample`{{execute}}


Helm charts repository: https://github.com/helm/charts
