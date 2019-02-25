#!/usr/bin/env sh
sleep 10

mkdir /old
cp -r /root/resources/* /old/
rm -rf /root/resources

mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources

kubectl delete pods --all
kubectl delete deployments --all
kubectl delete services --all