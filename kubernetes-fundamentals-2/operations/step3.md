The last piece of important configuration to provide to a Deployment is how to manage rolling updates. When you have production applications running in production, they will need to be updated. There are two primary ways to perform these application updates: rolling updates, and blue-green deployments.

Blue-green deployments involve deploying a new "green" version of your application. After if is successfully deployed, you point all new traffic to the "green" version, and recycle the old "blue" version.

Rolling updates are when you can specify a strategy to perform your updates in place, while minimizing impact on end-users. We can specify configuration for rolling updates in our Deployment manifest files.

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
     maxUnavailable: 25%  # how many Pods can be unavailable at a time
     maxSurge: 1          # how many extra Pods above replicas can be created
```

This YAML configures the ReplicaSet of the Deployment. In particular, when a RollingUpdate is executed, the maximum number of unavailable Pods will be limited to 25% of the total. In addition, as new Pods are created, the total number of pods cannot be greater than `replicas + maxSure`. With our Nginx Deployment, that would be 6.

This provides fine-grained control over how updates to your Pods are handled. `maxUnavailable` can be a percentage or an absolute value. The same goes for `maxSurge`.

However, sometimes, Pods are not available to serve content immediately after they are started. They should take a few seconds to start, but that is not always feasible. Kubernetes provides a Readiness Probe to determine when a Pod is successfully started. Combining Readiness Probes with RollingUpdates will minimize the downtime (if any) that your customers will experience.

Here is an example of a ReadinessProbe (note that this configures Containers in a Deployment):

```yaml
readinessProbe:
  httpGet:
    path: /              # resource to probe
    port: 80             # port to access on the container
  initialDelaySeconds: 5 # initial delay before starting the probe
  periodSeconds: 5       # delay between subsequent probes
  successThreshold: 1    # number of successes required
  failureThreshold: 5    # number of failures before restart
```

In particular, a ReadinessProbe will be used to determine when a new Pod is ready to process connections. Only when this occurs will old Pods be destroyed.

Combining RollingUpdates and ReadinessProbes help remove downtime from your end-users, except in the scenario where clients cannot use both versions of the backend Pods at the same time. That typically requires reworking application architecture.

Let's add in the RollingUpdate (modifies the ReplicaSet) and ReadinessProbe (modifies the containers) configuration into our Manifest file, and then update our Deployment.

`kubectl apply -f ./resources/nginx-deployment.yaml`{{execute}}

Finally, let's make sure that our Pods are running successfully:

`kubectl get pods`{{execute}}