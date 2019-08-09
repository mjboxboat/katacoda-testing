In this section we will cover Resource Limits. 

While Requests set the expected resources to be available to run, the Limits set the maximum amount of CPU or Memory that a pod will be able to consume.

In the CPU Limits deployment we added a limit of .5 CPU, but the pod will request 1 CPU:
```
        resources:
          limits:
            cpu: "500m"
```

In the Mem Limits deployment we added a limits of 100M, but the pod will request 150M:
```
        resources:
          limits:
            memory: "100M"
```

Run the following deployments then let's see how Kubernetes applies these rules when the limits are exceeded.

`kubectl apply -f /root/resources/deployment-cpu-limited.yaml`{{execute}}

`kubectl apply -f /root/resources/deployment-mem-limited.yaml`{{execute}}

Check on the status of the pods. Initially you will see that the memory pod is ok, but soon it will show "OOMKilled" (Out Of Memory Killed). Use CTRL+C to exit.

`watch kubectl get pods`{{execute}}

Let's see the resources being used by the pods:

`kubectl top pod`{{execute}}

The CPU pod should show it is using 500m (millicores, or .5 of 1 CPU) even though the process running inside wants 1 whole CPU. The memory pod doesn't even have time to show metrics because it is constantly being OOMKilled and restarted.

We can also see this behaviour in the dashboard: 

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com

In Kubernetes, when a pod is requesting more CPU than its limit allows, it is simply restricted to the CPU limit number. When a pod uses more memory than its limit, the pod is killed and restarted.

Let's clean up these deployments and move on to Step 3.

`kubectl delete -f /root/resources/deployment-cpu-limited.yaml`{{execute}}

`kubectl delete -f /root/resources/deployment-mem-limited.yaml`{{execute}}