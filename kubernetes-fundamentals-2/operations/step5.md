Now that we've created our Deployment and have the `nginx:alpine` version of the Docker image running, there's a problem. Our internal IT team discovered that there is a key vulnerability in the `nginx:alpine` image. We need to rollback the Deployment immediately, to a safer version.

Okay, there isn't really a key vulnerability in this image, but there will be scenarios where your team needs to roll back a Deployment to a previous version.

The first step is to look at your Deployment's version history. You may need to tweak the command if you named your deployment something different than `nginx-deployment`.

`kubectl rollout history deployment.v1.apps/nginx-deployment`{{execute}}

This view will give us the revision history of our Deployment object. The higher numbers are the most recent revisions. We'll need to look through these, and determine which revision we want to rollback to.

Now that we know which revision to rollback to, we can perform this task with the following command:

`kubectl rollout undo deployment.v1.apps/nginx-deployment --to-revision=X`

Just replace `X` with the revision in your environment that makes sense.

Now, we can watch the rollback in action:

`watch -n 2 kubectl get deployments`{{execute}}

or

`watch -n 2 kubectl get pods`{{execute}}