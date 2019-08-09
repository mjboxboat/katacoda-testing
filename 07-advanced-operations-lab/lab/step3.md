In this section, we will cover Readiness Probes. 

Official Documentation here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/

Readiness Probes are for when an application might need to load large data or configuration files during startup, or depend on external services after startup. In such cases, you don’t want to kill the application, but you don’t want to send it requests either.

We added the following Readiness config:

```
          tcpSocket:
            port: 8080
          initialDelaySeconds: 10
          periodSeconds: 10
```

Run 2 deployments. One will have a Readiness endpoint that cannot be reached and the other will be reachable.

`kubectl apply -f /root/resources/deployment-readiness-probe-fail.yaml`{{execute}}

`kubectl apply -f /root/resources/deployment-readiness-probe-success.yaml`{{execute}}

Check on the pods:

`kubectl get pods`{{execute}}

Check the dashboard and see what is going on with each pod:

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com

Notice that the "fail" pod never starts because the Readiness check is getting "Connection refused" from the checkpoint we defined. This pod will continue to restart and try to check the readiness port before becoming viable.

In this case, we intentionally defined an incorrect port, but it could fail for many reasons and you will need to investigate the container/pod to see why. It may be because this is an update to your deployment and the new image is not listening on the same port as the check was configured for.

The successful pod is was able to be reached by the Readiness check and is now online.

Let's clean up and move on to Step 4.

`kubectl delete -f /root/resources/deployment-readiness-probe-fail.yaml`{{execute}}

`kubectl delete -f /root/resources/deployment-readiness-probe-success.yaml`{{execute}}