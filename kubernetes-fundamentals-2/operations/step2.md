In our example, we are only deploying Nginx. Nginx isn't kown to use a lot of memory. In fact, it is extremely lightweight. However, in general, you want to limit the resources that an individual application can consume. There are countless instances of individual microservices not having resource bounds, with the worst case scenario leading to a cascading cluster failure in production.

This generally happens when end-user load increases, which causes an individual microsersvice to utilize more resources, such as memory. Load keeps increasing, so the individual replicas need more memory. At some point, a host becomes staved, and goes down. Kubernetes will then reschedule those pods onto additional nodes, but now the cluster has lost a certain percentage of its total avaiable resources. This forms a positive feedback loop that will bring down the entire cluster if not quickly mitigated.

To mitigate this, you typically provide resource requests and limits for your Pods. A resource request is the bare minimum that a Pod needs, a resource limit is the maximum that a Pod can utilize.

Kubernetes actually uses resource requests to determine where to schedule a Pod. If a host has 4 vCPU and there are 8 Pods with requests totaling 4 CPU, Kubernetes will not schedule new Pods there, even if the current CPU usage on that individual host would allow for it.

Here is the additional configuration we'll need to supply to our Nginx Pod so that we an control its resource usagee:

```yaml
resources:
  requests:
    memory: "64Mi"
    cpu: "0.25"
  limits:
    memory: "128Mi"
    cpu: "0.5"
```

This means the Nginx Pods will each *request* 64 MB of RAM, and 25% of a single CPU core. CPU cores are exactly what they sound like. If you have a 4 core CPU VM with hyperthreading, then running a single Nginx Pod leaves 7.75 cores of compute resources remaining for Kubernetes scheduling.

In addition, units represent the same thing on various hosts. 0.5 CPU is the same on a 4 or 48-core system. Realize that not all cores are created equal, and the clock speed on that 4-core system is probably faster than the 48-core system.

Kubernetes will convert these specified resource limits into values that the Docker daemon understands when individual containers in your Pod are actually run.

Let's add these resource requests/limits to our `./resources/nginx-deployment.yaml` file, and then update our Deployment:

`kubectl apply -f ./resources/nginx-deployment.yaml`{{execute}}

And, let's verify that the Pods are now running:

`kubectl get pods`{{execute}}