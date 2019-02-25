Next, we need to deploy ClusterIP services for each of our Deployments:

`kubectl create -f ./resources/jwilder-clusterIP.yaml`{{execute}}

`kubectl create -f ./resources/tutum-clusterIP.yaml`{{execute}}
