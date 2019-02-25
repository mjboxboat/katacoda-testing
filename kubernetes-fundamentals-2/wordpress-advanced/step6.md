At this point, WordPress should be up and running. The NodePort Service for MySQL lets Kubernetes choose the port to expose the application on. Check the port, and view it in the browser to make sure it is working.

`kubectl get deployments`{{execute}}

`kubectl get svc`{{execute}}

`kubectl get pods`{{execute}}

From there, you can read logs from individual objects to determine the issue.