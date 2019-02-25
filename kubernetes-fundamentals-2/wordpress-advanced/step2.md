The WordPress frontend needs to know how to reach the MySQL database for storage. On Day 1 of the course, we specified this directly via an environment variable. However, that couples the configuration to the actual Deployment, which is something we'd like to avoid.

Kubernetes ConfigMaps allow us to decouple this information from the actual application.

Your job is to create a ConfigMap that contains the name used to reach the MySQL backend. This value will be equal to the name of the Servie that proxies the MySQL database. You can accomplish this by creating a ConfigMap from [literal values](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/).

Once you've created your ConfigMap, verify that it exists:

`kubectl get configmaps`{{execute}}

The output of the command should look something like:

```
NAME         DATA   AGE
mysql-host   1      4s
```

make sure you notate the values you specify, you will need them later.
