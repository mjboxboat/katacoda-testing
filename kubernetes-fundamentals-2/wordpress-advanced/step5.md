At this point, we have all the resources that we need to deploy WordPress -- we just need to configure it by updating the Deployment YAML files to use the resources.

Next, you'll need to edit the `./resources/wordpress-deployment.yaml` file, and provide the following upgrades:

1. Update the file to include a [Persistent Volume Claim](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/) for the Persistent Volume you recently created. Remember, a single manifest YAML file can contain multiple object descriptions, so just put this at the top before the Deployment.

2. Update the file so the Pod in the Deployment uses the environment variable MYSQL_ROOT_PASSWORD, where the value is obtained from the Secret you recently created. Remember, Secrets can provide the value to [environment variables](https://kubernetes.io/docs/concepts/configuration/secret/).

3. Update the file so the Pod in the Deployment uses the environment variable WORDPRESS_DB_HOST, where the value is obtained from the ConfigMap you recently created. Remember, ConfigMaps can provide the value to [environment variables](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/).

4. Update the file so the Pod in the Deployment uses the Persistent Volume Claim from step 1 to populate the directory `/var/www/html` with persistent storage.

Once you've provided those updates, create your WordPress deployment with `kubectl create`. Next, verify that your Persistent Volume Claim was successful:

`kubectl get pvc`{{execute}}

The output should look like:

```
NAME             STATUS    VOLUME                                     CAPACITY ACCESS MODES   STORAGECLASS   AGE
wp-pv-claim      Bound     pvc-e69d834d-d477-11e7-ac6a-42010a800002   20Gi     RWO            standard       7s
...
```

After that, verify that your Pod is running. Remember, it can take a minute or two for it to successfully start:

`kubectl get pods`{{execute}}

The output should look like:

```
NAME        TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)        AGE
wordpress   ClusterIP   10.0.0.89    <pending>     80:32406/TCP   4m
```

Finally, make sure that WordPress started successfully by getting the logs.