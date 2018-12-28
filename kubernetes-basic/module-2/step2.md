Lets deploy the Kubernetes UI (Dashboard) and take a quick look around.

- To deploy the dashboard, run the following command. `kubectl apply -f https://gist.githubusercontent.com/mjboxboat/9601f7aff786f52bce3f4af7e21b8339/raw/572f1c056c9385fb5ebc8a55a64717331028b284/kube-dash.yml`{{execute}}
- Now we can check to see if the Dashboard pod is running. `kubectl get pods -n kube-system`{{execute}}
- And we can also check to see what port the Dashboard is exposed on. `kubectl get svc -n kube-system`{{execute}}

In the next step, we will deply the Kubernetes UI (Dashboard).
