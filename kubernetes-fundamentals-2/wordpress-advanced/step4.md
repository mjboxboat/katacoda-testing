At this point, we have all the resources that we need to deploy MySQL -- we just need to configure it by updating the Deployment YAML files to use the resources.


First, you'll need to edit the `./resources/mysql-deployment.yaml` file, and provide the following upgrades:

1. Update the file to include a [Persistent Volume Claim](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/) for the Persistent Volume you recently created. Remember, a single manifest YAML file can contain multiple object descriptions, so just put this at the top before the Deployment. You can put a `--` between objects in your manifest file.

2. Update the file so the Pod in the Deployment uses the environment variable MYSQL_ROOT_PASSWORD, where the value is obtained from the Secret you recently created. Remember, Secrets can provide the value to [environment variables](https://kubernetes.io/docs/concepts/configuration/secret/).

3. Update the file so the Pod in the Deployment uses the Persistent Volume Claim from step 1 to populate the directory `/var/lib/mysql` with persistent storage.

Once you've provided those updates, create your MySQL deployment with `kubectl create -f ./resources/mysql-deployment`{{execute}}. Next, verify that your Persistent Volume Claim was successful:

`kubectl get pvc`{{execute}}, Status should be `Bound`

After that, verify that your Pod is running. Remember, it can take a minute or two for it to successfully start:

`kubectl get pods`{{execute}}

The output should look like:

```
NAME                               READY     STATUS    RESTARTS   AGE
wordpress-mysql-1894417608-x5dzt   1/1       Running   0          40s
```

However, just because the Pod is running doesn't mean it is working. You should view the log output to make sure everything is okay.