Now that we've covered a simple Deployment, let's walk through and create a fully featured one. We will deploy Tutum with additional configuration options.

First, let's all start off with the same file: `touch ./resources/tutum-full.yaml`{{execute}}

Now, let's populate this file with the base content for a Deployment:

```yaml
apiVersion: 
kind: 
metadata: 
spec: 
```

What values should we put in for each of these?

1. `apiVersion: apps/v1`
2. `kind: Deployment`
3. `metadata`? We need to apply a `name` and `labels`, let's say `app=tutum`
4. `spec` is a complex component, where we need to configure our RS and Pod

We should have something similar to shis:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tutum-deployment
  labels:
    app: tutum
spec:
```

Next, let's add the scaffolding required to configure the RS and Pods:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tutum-deployment
  labels:
    app: tutum
spec:
  # RS config goes here
  template:
    metadata:

    spec:
      containers:
```

Now that we've got the scaffolding, let's configure the RS

1. We need to set the number of `replicas`
2. We need to configure a `selector` to `matchLabels`

Let's stick with 3 replicas. Remember, we need the RS To match labels on the Pod.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tutum-deployment
  labels:
    app: tutum
spec:
  replicas: 3
  selector:
    matchLabels:
      app: tutum
  template:
    metadata:

    spec:
      containers:
```

Now we need to give the Pods the appropriate labels so the RS will match with it. In addition, let's configure the containers.

1. We need to apply the label `app=tutum` to the Pod
2. We need a single container, let's call it `tutum`
3. We need to specify the image, which is `tutum/hello-world`
4. The Pod needs to expose port `80`

This configuration leads us to create this file (or similar):

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tutum-deployment
  labels:
    app: tutum
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

Now that we've got the application configured, we can always add additional PodSpec like what we did in the previous Pod lab. For now, let's deploy the application:

`kubectl create -f ./resources/tutum-full.yaml`{{execute}}

Who can help me validate that the Deployment was successful?

1. Check Pod status
2. Make a request against the webserver

At this point, you can make Deployments as simple or advanced as you want.