Welcome to the BoxBoat "Kubernetes Training" Basics series. This is Module 3, Kubernetes Pods. This lab will show you how to launch a pod from the kubectl command line, create a pod manifest file and then launch a new pod into Kubernetes. We will then test internal cluster access to this system.

Lets deploy the Kubernetes UI (Dashboard) and so you can have a UI to explore what we are deploying.

- To deploy the dashboard, run the following command. `kubectl apply -f https://gist.githubusercontent.com/mjboxboat/d1d51560c485cdeb500fa1343a211469/raw/0fc3290dfb1fd66d1d2bbd957982999b37d52b6b/kube-dash.yaml`{{execute}}
- Now we can check to see if the Dashboard pod is running. `kubectl get pods -n kube-system`{{execute}}
- And we can also check to see what port the Dashboard is exposed on. `kubectl get svc -n kube-system`{{execute}}
- Once the dashboard is up and running, we can visit the external URL on port 30000 by clicking this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/

In the next step, we will deploy a single pod using the `kubectl` CLI.
