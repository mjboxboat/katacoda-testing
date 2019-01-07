The second step to deploying WordPress is to create a MySQL Deployment.

First, create your Deployment file:

`touch mysql-deployment.yaml`{{execute}}

Next, you'll need to properly configure the MySQL Deployment. To review the file format, please see the Kubernetes [documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/).

The MySQL Deployment requires the following configuration:

**Metadata**
1. name: wordpress-mysql
2. labels: app: wordpress

**ReplicaSet Selector**
1.  app: wordpress
2.  tier: mysql

**Pod Labels**
1.  app: wordpress
2.  tier: mysql

**Pod Spec**
1. container image: mysql:5.6
2. container name: mysql
3. container port: 3306
4. container port name: mysql

**Environment Variables**
1. MYSQL_ROOT_PASSWORD: root

After you have created the mysql-deployment.yaml file and are ready to create the Service, execute:

`kubectl apply -f mysql-deployment.yaml`{{execute}}

Verify that your Deployment started successfully:

`kubectl get deployments`{{execute}}