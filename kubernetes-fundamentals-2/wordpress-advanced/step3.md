Both WordPress and MySQL require persistent volumes, as the applications aren't exactly stateless. On day 1 of this course, we used a local volume mount on the actual host. However, when a Pod goes down, that data may be lost depending where it is rescheduled. To deal with this, we'll use a Persistent Volume.

On Katacoda, we'll only use `hostPath` volumes. But in real-world scenarios, you can use NFS or vendor-specific volumes (such as AWS EBS).

Your job is to create a manifest YAML file to provision the needed persistent volumes using the local host for storage, this is called a `hostPath` [volume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/).  `hostPath` volumes should only be used for testing purposes as it only works in single node environments.

Once you've created your Persistent Volumes, verify it is there:

`kubectl get pv`{{execute}}

**Important** PVs have different support for [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes). ensure you account for this.  