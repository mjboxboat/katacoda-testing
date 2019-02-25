#!/usr/bin/env sh

sleep 10

# cp -r /root/resources /old/
rm -rf /root/resources
mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources
kubectl delete all --all

# Prepull docker images used
docker pull tomcat:7.0
docker pull ananwaresystems/webarchive:1.0

# Hax
# https://github.com/fnproject/fn-helm/issues/21
kubectl create serviceaccount --namespace kube-system tiller
kubectl delete clusterrolebinding tiller-cluster-rule
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

