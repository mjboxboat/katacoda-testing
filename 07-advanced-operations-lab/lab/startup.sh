#!/usr/bin/env sh

sleep 10
rm -rf /root/resources
mkdir -p /root/resources
cp -r /root/newresources/* /root/resources
rm -rf /root/newresources
kubectl delete all --all
minikube start
minikube addons enable heapster
minikube addons enable metrics-server
minikube addons enable dashboard
kubectl apply -f /root/resources/dashboard.yaml

