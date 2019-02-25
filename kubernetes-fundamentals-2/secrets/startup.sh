#!/usr/bin/env sh
sleep 10
rm -rf /root/resources
mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources
kubectl delete all --all

rm -rf /root/configs
rm -rf /root/env

