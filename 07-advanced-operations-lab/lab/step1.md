Welcome to the BoxBoat Bootcamp! In this Lab we will be covering Deployments in depth. For more info, visit the official documentation here: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

Config files are located in `./resources`. Please take time to review them.

You should already be familiar with Kubernetes Deployments by now, but this lab should help add some additional features and functionality to basic deployments.

First, let's make sure the environment is ready. Wait until the node Status is "Ready". To exit the below command use CTRL+C.

`watch kubectl get nodes`{{execute}}

In this first section we will cover Resource Requests. Requests are the minimum available requirements that should be met for CPU and Memory for a pod to be scheduled on a node. If there aren't any nodes available that can handle the request, then the pod cannot be scheduled.

On the CPU requested deployment we requested 5 CPUs:

```
        resources:
          requests:
            memory: "50M"
            cpu: "5"

```

On the Mem requested deployment we requested 5G of memory:

```
        resources:
          requests:
            memory: "5Gi"
            cpu: ".5"
```

Let's test this. Run the 2 deployments below, then we let's take a look at any errors we see. Each deployments request much more CPU and Memory than is available on a single node.

`kubectl apply -f /root/resources/deployment-cpu-requested.yaml`{{execute}}

`kubectl apply -f /root/resources/deployment-mem-requested.yaml`{{execute}}

Check the status and you will see both are "Pending":

`kubectl get pods`{{execute}}

Describe the pods to see why they aren't scheduled (look at the last line):

`kubectl describe pod cpu-`{{execute}}

`kubectl describe pod mem-`{{execute}}

We can also see this on the Kubernetes Dashboard:

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com

You can see that they both fail to schedule due to insufficient resources.

The takeaway here is that when thinking about setting the Resource Requests for your pods, make sure that they are realistic and will be able to be met. If there aren't any nodes that can meet the requests, the pods won't run.

Click the links below to cleanup this section, then proceed to Step 2.

`kubectl delete -f /root/resources/deployment-cpu-requested.yaml`{{execute}}

`kubectl delete -f /root/resources/deployment-mem-requested.yaml`{{execute}}