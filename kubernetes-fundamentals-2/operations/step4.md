Now that we finally have our Deployment configured properly to maintain HA, expose our Pods to our Load Balancer, restrict resource usage, perform rolling updates, and adhere to a readiness probe, we can now perform a rolling update. 

Right now, we are running a specific version of Nginx. Let's update it to use `nginx:apline`. This is a very lightweight version of Nginx that only needs about 18 MB of Docker Image layers, as opposed to approximately 110 MB used by the default image.

Now, let's update the image in our Deployment file, and perform the rolling update:

`kubectl apply -f ./resources/nginx-deployment.yaml`{{execute}}

Now, we can watch the rolling update in action:

`watch -n 2 kubectl get deployments`{{execute}}

We can see Kubernetes adhering to our Rolling Update strategy as this happens.