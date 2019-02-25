The Kubernetes dashboard allows you to view your applications in a UI. In this deployment, the dashboard has been made available on port 30000.

Lets first deploy the dashboard from a YAML file hosted on Github (yes, you can do that!)

`kubectl apply -f https://gist.githubusercontent.com/mjboxboat/d1d51560c485cdeb500fa1343a211469/raw/0fc3290dfb1fd66d1d2bbd957982999b37d52b6b/kube-dash.yaml`{{execute}}

Now let's check to see if the dashboard Pod is running.

`kubectl get pods --selector=k8s-app=kubernetes-dashboard -n kube-system`{{execute}}

Once the Pod is in a running state, we can view the dashboard using the link below.

The URL to the dashboard is https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com

As you can see, the dashboard gives us a graphical view of our cluster. We can see all of the objects in the cluster, and actually schedule workloads. We won't be using the dashboard during these training sessions, but as you continue your Kubernetes learning journey, it is a great resource.

We recommend doing all of your Kubernetes learning on the CLI so you can develop the muscle memory to run these commands without having to run through the Kubernetes [documentation](https://kubernetes.io/docs/home/).