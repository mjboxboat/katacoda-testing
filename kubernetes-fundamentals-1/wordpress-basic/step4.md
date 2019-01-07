The third step to deploying WordPress is to create a WordPress Service.

First, create your Service file:

`touch wordpress-service.yaml`{{execute}}

Next, you'll need to properly configure the WordPress Service. To review the file format, please see the Kubernetes [documentation](https://kubernetes.io/docs/concepts/services-networking/service/). Given that WordPress won't be exposed to the Internet, what type of Service should be specified?

The WordPress Service requires the following configuration:

**Metadata**
1. name: wordpress
2. labels: app: wordpress

**Spec**
1. port: 80
2. NodePort: let Kubernetes choose

**Selector**
1. app: wordpress
2. tier: frontend

After you have created the wordpress-service.yaml file and are ready to create the Service, execute:

`kubectl apply -f wordpress-service.yaml`{{execute}}

Verify that your service successfully started:

`kubectl get services`{{execute}}