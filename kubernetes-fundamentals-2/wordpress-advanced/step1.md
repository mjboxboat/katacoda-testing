We've provided the Services and Deployments files necessary to start this lab. You can find them in the `./resources` directory. You will be using them, and also creating additional files to help deploy a more rugged version of WordPress this afternoon.

The database backing WordPress is MySQL in this instance. On Day 1 of the course, we specified a password for the database directly via an environment variable. However, that couples the configuration to the actual Deployment, which is something we'd like to avoid.

Kubernetes Secrets allow us to decouple this information from the actual application.

Your job is to create a password, and store it as a Kubernetes Secret for the MySQL Deployment to consume. You can accomplish this by creating a secret on the [command line](https://kubernetes.io/docs/concepts/configuration/secret/).

Once you've created your Secret, verify that it exists:

`kubectl get secrets`{{execute}}

The output of the command should look something like:

```
NAME         TYPE     DATA   AGE
mysql-pass   Opaque   1      42s
```
