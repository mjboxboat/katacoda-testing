Helm comes in 2 parts: The Helm CLI which runs on client machines, and the Tiller application which runs in the Kubernetes cluster.

Upon initialization, Helm deploys leverages the `kubeconfig` on the machine to communicate with a Kubernetes cluster and deploy the Tiller application to that cluster. Tiller is used to translate charts in to Kubernetes resources, and maintains information about applications deployed through Helm.

# Installing Helm
Helm comes pre-installed on these instances, otherwise it could be installed using:

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash`

Initialize Helm:

`helm init`{{execute}}

Helm automatically used the current Kubernetes context for initialization. By default Helm deploys Tiller to the `kube-system` namespace. We can see it here:

*FIX:* The current version of helm installed on the lab environment requires some additional permissions, run the following: `kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'; helm init --client-only`{{execute}}

`kubectl get pods -n kube-system`{{execute}}

The Helm executable comes with built-in help. Over the course of this lab, we will be looking at a number of these topics:

`helm --help`{{execute}}

Helm website: https://helm.sh/
