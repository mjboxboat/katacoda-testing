Namespaces provide a way to compartmentalize a Kubernetes cluster. You can provide each user a unique namespace, with compute and storage resources. Pods running in different namespaces can still communicate, but if I don't have access to a specific namespace, I cannot interfact with configuration and management of those resources.

One simple application of namespaces is a coud-based development environment. Each developer can have their own namespace on a Kubernetes cluster. That way, you can deploy the entire software stack without having someone else interfere with your applications.

First, let's see what namespaces already exist:

`kubectl get namespaces`{{execute}}

Now, we can create our own namespace. Here is a YAML file that describes one:

```yaml
apiVersion: v1
kind: Namespace
metadata: 
  name: development
  labels:
    name: development
```

We can create this via:

`kubectl create -f ./resources/dev-ns.yaml`{{execute}}

Now, let's see the namespaces:

`kubectl get namespaces`{{execute}}

And we can inspect our namespace as well:

`kubectl describe namespace development`{{execute}}

Let's also create a namespace for production:

```yaml
apiVersion: v1
kind: Namespace
metadata: 
  name: production
  labels:
    name: production
```

`kubectl create -f ./resources/prod-ns.yaml`{{execute}}

Now that we've got 2 namespaces, we can create Deployments to run in a single namespace:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tutum-deployment
  labels:
    app: tutum
  namespace: production
spec:
  replicas: 3
  selector:
    matchLabels:
      app: tutum
  template:
    metadata:
      labels:
        app: tutum
    spec:
      containers:
      - name: tutum
        image: tutum/hello-world
        ports:
        - containerPort: 80
```

This is the Deployment Manifest we used for the Ingress demonstration earlier today. Note that we've now added a namespace key to our Deployment metadata. This allows us to associate the Pod, ReplicaSet, and Deployment resources with the production namespace.

Let's deploy this application:

`kubectl create -f ./resources/tutum.yaml`{{execute}}

Now, let's look at the Deployments:

`kubectl get deployments`{{execute}}

Note that we do not see the Tutum Deployment here. We need to specify a namespace:

`kubectl get -n production deployments`{{execute}}

Now we can clearly see that Tutum is running as expected.

Individual users can be tied to a specific namespace. That way, they will only have resources available to them in that namespace. As an example, an administrator can provision a PersistentVolume in a namespace for an individual user to use with their Deployments. This allows for separation of resources between users and applications.

Another application is what we alluded to here: you can have a single Kubernetes cluster, but individual namespaces for development, test, and production.