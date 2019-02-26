Let's run a Pod from the CLI first. 

The following command will run a Pod named "nginx" with a container inside called "nginx" using the image "nginx:latest".

`kubectl run nginx --image=nginx --replicas=1`{{execute}}

Now lets check to see if the pod is up by issuing `kubectl get pods -o wide`{{execute}}

We can see that there is a single nginx Pod running and we can also see the Pods internal IP and what node it is running on.

We can also dig a bit deeper into this Pod by running `kubectl describe pod nginx`{{execute}}. This command shows us alot of information about the pod including namespace, the image used to launch, events and much more.

Also, if we run `kubectl get deployment`{{execute}} we can see that a Deployment was automatically created to manage the Pod. We will discuss deployments in a future module.

Let's remove this Pod for now and in the next section we will create a similar pod using a manifest YAML. `kubectl delete deploy nginx`{{execute}}