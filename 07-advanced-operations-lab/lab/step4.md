In this section we will cover Liveness Probes.

Official Documentation here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/

Liveness probes differ from Readiness checks in that they are run continuously through the life of the Pod. Many applications running for long periods of time eventually transition to broken states, and cannot recover except by being restarted. Kubernetes provides liveness probes to detect and remedy such situations.

We added the following to the deployment for the liveness probe. This can also be a TCP call:

```
        livenessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 30
          periodSeconds: 20
```

Run the following 2 deployments. They will each pass their "Readiness" checks in 30 seconds, but the "Liveless" probes will fail on one of the deployments.

`kubectl apply -f /root/resources/deployment-liveness-probe-fail.yaml`{{execute}}

`kubectl apply -f /root/resources/deployment-liveness-probe-success.yaml`{{execute}}

Check the status of the Pods:

`kubectl get pods`{{execute}}

And also check on the pods in the Dashboard:

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com

You can see that the "success" pod is working. If you check the logs of the successful pod, you will see log messages like `"GET / HTTP/1.1" 200 612 "-" "kube-probe/1.15" "-"` , indicating that the kube-probe is checking it on a regular interval to make sure it is reachable and working as intended.

The failure pod continues to try to restart, but the liveness probe cannot reach and it and continues to fail. In an real scenario, a container may become unhealthy over time, and the liveness probe will catch when it does, restart it, and return it to a healthy state.

Let's clean up and move the last step in the lab, Step 5.

`kubectl delete -f /root/resources/deployment-liveness-probe-fail.yaml`{{execute}}

`kubectl delete -f /root/resources/deployment-liveness-probe-success.yaml`{{execute}}