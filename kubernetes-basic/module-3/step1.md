Welcome to Kubernetes Fundamentals Training - Module 3- Kubernetes Pods

Welcome to the BoxBoat "Kubernetes Training" Basics series. This is Module 3, Kubernetes Pods. This lab will show you how to launch a pod from the kubectl command line, create a pod manifest file and then launch a new pod into Kubernetes. We will then test internal cluster access to this system.

First, lets make sure our cluster is ready and we can run basic "kubectl" commands.

- Run the following command to make sure that Kubernetes is ready. `launch.sh`{{execute}}

- Now lets check the status of the cluster components
  - This shows the nodes in the cluster. `kubectl get nodes`{{execute}}
  - This will show the kubernetes system pods running. `watch -n .5 kubectl get pods -n kube-system`{{execute}} Once all pods show as "running" you can proceed to the next step. Hit *"CTRL+C"* to exit the watch.
  - This will show the current pods, deployments, deployments and namespaces. `kubectl get pods,deploy,svc,ns -n kube-system`{{execute}}

In the next step, we will deply the Kubernetes UI (Dashboard).
