In this last section, we will take a look at Rolling Updates.

There are a number of update strategies including Rolling, Recreate, Blue/Green (via labels) and Canary.

We will cover the most common which is a Rolling Update. This allows you to control the number or percentage of pods that are scaled beyond what the deployment originally called for, the number of unavailable pods at any given time, and the length of the rollout.

Here are the deployment details we added here:

```
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 0
      maxUnavailable: 1
  minReadySeconds: 10
```

When a deployment is updated, Kubernetes creates a new Replica Set and deploys the new pods in that newly created RS. It will then remove them from the old RS based on the options be chose in the strategy spec.

Let's deploy V1 of the app and make sure it is working.

`kubectl apply -f /root/resources/deployment-nginx-v1.yaml --record=true`{{execute}}

We can see when the pods are all online:

`kubectl get deployments`{{execute}}

`kubectl get pods`{{execute}}

And we can reach the V1 deployment here:

https://[[HOST_SUBDOMAIN]]-32005-[[KATACODA_HOST]].environments.katacoda.com/

Now, let's upgrade to a new image from the command line:

`kubectl set image deployments/nginx nginx=nginx:1.17 --record=true`{{execute}}

We can watch the rollout happen:

`kubectl rollout status deployments/nginx`{{execute}}

Also, we can see 2 nginx ReplicaSet's.

`kubectl get rs`{{execute}}

Note that in out plan we can only update 1 pod at a time and we have to wait 10 seconds in between a new pod coming online before we proceed. This will need be to adjusted with larger deployments to match the acceptable number of pods offline and overall time the rollout takes.

Next, let's use a YAML file to update the image and ConfigMap for the deployment. This is the preferred method as this is trackable via SCM.

`kubectl apply -f /root/resources/deployment-nginx-v2.yaml --record=true`{{execute}}

We can see the V2 rollout here:

`kubectl rollout status deployments/nginx`{{execute}}

When it is done, we can verify via a browser:

https://[[HOST_SUBDOMAIN]]-32005-[[KATACODA_HOST]].environments.katacoda.com/

Lastly, if the last 2 deployments went wrong for some reason and you needed to roll back, you can via the CLI. Let's first check the history.

`kubectl rollout history deployments/nginx`{{execute}}

Then, we can rollback to the number of the deployment we want.

`kubectl rollout undo deployments/nginx --to-revision=1`{{execute}}

Watch the rollout:

`kubectl rollout status deployments/nginx`{{execute}}


This completes the Advanced Deployments Lab. Please let your instructors know if you have any questions.