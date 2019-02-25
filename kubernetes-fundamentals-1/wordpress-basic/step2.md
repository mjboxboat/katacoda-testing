The first step is to create a MySQL Service.

First, create your Service YAML file:

`touch ./resources/mysql-service.yaml`{{execute}}

Next, you'll need to properly configure the MySQL Service. To review the file format, please see the Kubernetes [documentation](https://kubernetes.io/docs/concepts/services-networking/service/). Given that MySQL won't be exposed to the Internet, what type of Service should be specified?

The MySQL Service requires the following configuration:

**Metadata**
1. name: wordpress-mysql
2. labels: app: wordpress

**Spec**
1. port: 3306

**Selector**
1. app: wordpress
2. tier: mysql

After you have created the mysql-service.yaml file and are ready to create the Service, execute:

`kubectl apply -f ./resources/mysql-service.yaml`{{execute}}

Verify that your service successfully started:

`kubectl get services`{{execute}}