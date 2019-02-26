Let's see how we can show that the the Nginx service is running and accessible inside the pod. 

We can test this from 'inside' the cluster by running a curl from the command line against the pod.

First, lets run `kubectl get pods -o wide`{{execute}} to find the internal ip of the Pod.

Now, let's copy that IP and run `curl http://POD_IP` ((*you will need to type this manually using the ip of your specific pod*)). You should see a block of text that includes "Welcome to nginx!".

In the Pod spec, we exposed the port 80 of this pod. Let's see if we can get to nginx from outside the cluster on port 80 from the internet. https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

Whoops, looks like that isn't working. Any idea why? If you said "because there is no service yet", then you are correct. We haven't exposed the pod to the outside world using a Kubernetes Service, so it is only available inside the Kubernetes cluster for now.

That completes the lab for Module 3. In a future lab (Module 5) we will discuss Services. In the next Module (Module 4) we will discuss why you wouldn't want to run singleton pods like we did here and how we can run them using Kubernetes Deployments. Stay tuned.

curl http://POD_IP ((*you will need to type this manually using the clusterip of your specific service*))