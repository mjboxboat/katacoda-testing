We've already seen how to get basic information from a Pod, using `kubectl get` and `kubectl describe`. Now, let's start running commands inside Pods to improve our debugging capabilities.

## Execute Commands

We can use Kubectl exec to execute a command inside the Pod. The format is:

`kubectl exec [OPTIONS] pod-name -- [COMMAND]`

For example, to list the enviroment variable in the running Tutum pod:

`kubectl exec tutum -- env`{{execute}}

or to run a shell inside a pod:

`kubectl exec -ti tutum -- /bin/sh`{{execute}}

Now that we have a shell inside our Tutum Pod, what's going on? The Tutum Pod only has a single container, so we have a shell in that container. Why don't we explore around a little bit. We can look at environment variables, processes, the filesystem, etc.

When you really need to debug a problem, this is how you will do it.

Use `exit` to exit the shell running in the pod.

*NOTE*: -t and -i, they specify interactive and allocate a TTY

How does this compare to performing the process with Docker?

Who can help me:
1. Find out where the Pod is running
2. Get the IP address of our Pod
