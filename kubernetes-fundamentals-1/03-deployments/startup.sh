#!/usr/bin/env sh
#sleep 20 # trying 20 to see if it helps with race conditions

echo "$(date) copy to old" > ~/.log.txt
mkdir /old
cp -r /root/resources/* /old/
rm -rf /root/resources

echo "$(date) copy to new" >> ~/.log.txt
mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources

echo "$(date) delete" >> ~/.log.txt
kubectl delete pods --all
kubectl delete deployments --all
kubectl delete services --all

echo "$(date) done" >> ~/.log.txt
