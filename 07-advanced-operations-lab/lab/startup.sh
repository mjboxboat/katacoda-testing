#!/usr/bin/env sh

sleep 10
rm -rf /root/resources
mkdir -p /root/resources
cp -r /root/newresources/* /root/resources
rm -rf /root/newresources
kubectl delete all --all
minikube addons enable heapster
minikube addons enable metrics-server
minikube addons enable dashboard


export NODE01=$(tail -n 1 /etc/hosts | awk '{print $1}')
echo "$NODE01 default\n\
$NODE01 green.algo\n\
$NODE01 blue.algo\n\
$NODE01 weighted.algo" >> /etc/hosts
chmod +x /root/resources/weighted-test.sh
