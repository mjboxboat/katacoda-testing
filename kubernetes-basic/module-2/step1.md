Welcome to Kubernetes Fundamentals Training - Module 2 - Intro to Kubernetes

This lab will demonstrate how quickly Kubernetes can deploy containers and complex working applications and expose them for external access. 

First, lets make sure our cluster is ready and we can run basic "kubectl" commands.

- Run the following command to make sure that Kubernetes is ready. `launch.sh`{{execute}}

- Now lets check the status of the cluster components
  - This shows the nodes in the cluster. `kubectl get nodes`{{execute}}
  - This will show the kubernetes system pods running. `kubctl get pods -n kube-system`{{execute}}
  - This will show the current pods, deployments, deployments and namespaces. `kubectl get pods,deploy,svc,ns`{{execute}}
