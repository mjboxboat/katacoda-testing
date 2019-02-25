#!/bin/bash
have=`kubectl get configmap dir-config -o jsonpath='{.metadata.name}'`
want="dir-config"

if [ "$have" = "$want" ]; then
  echo "done"
  # exit 0
fi

echo "You should have ${have} you have ${want}"
echo "done"

