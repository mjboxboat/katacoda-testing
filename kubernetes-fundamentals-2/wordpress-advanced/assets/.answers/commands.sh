kubectl create secret generic mysqlpass --from-literal=pass=secret
kubectl create configmap mysql-host --from-literal=hostname=mysql
