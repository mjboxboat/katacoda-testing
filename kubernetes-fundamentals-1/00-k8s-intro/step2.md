Right now, we have a Kubernetes cluster running. The cluster can be interacted
with using the kubectl CLI. This is the main approach used for managing
Kubernetes and the applications running on top of the cluster.

Details of the cluster and its health status can be discovered via
`kubectl cluster-info`{{execute}}

To view the nodes in the cluster using `kubectl get nodes`{{execute}}

If the node is marked as NotReady then it is still starting the components.

This command shows all nodes that can be used to host our applications. At this
stage, we should have 2 nodes that are both ready for us to deploy applications
on.

We can see the other host in our cluster, and actually SSH to it:

`ssh node01`{{execute}}

However, we will be managing our Kubernetes cluster from the master, so exit
the SSH connection by typing `exit`.
