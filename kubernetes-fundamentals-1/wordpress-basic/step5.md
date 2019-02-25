The final step is to create a WordPress Deployment.

First, create your Deployment file:

`touch ./resources/wordpress-deployment.yaml`{{execute}}

Next, you'll need to properly configure the WordPress Deployment. To review the file format, please see the Kubernetes [documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/).

The WordPress Deployment requires the following configuration:

**Metadata**
1. name: wordpress
2. labels: app: wordpress

**ReplicaSet Selector**
1. app: wordpress
2. tier: mysql

**Pod Labels**
1. app: wordpress
2. tier: frontend

**Pod Spec**
1. container image: wordpress
2. container name: wordpress
3. container port: 80
4. container port name: wordpress

**Environment Variables**
1. WORDPRESS_DB_HOST: wordpress-mysql
2. WORDPRESS_DB_PASSWORD: password

**Volumes**
1. Create a local Pod volume at /var/www/html


After you have created the wordpress-deployment.yaml file and are ready to create the Service, execute:

`kubectl apply -f ./resources/wordpress-deployment.yaml`{{execute}}

Verify that your Deployment started successfully:

`kubectl get deployments`{{execute}}