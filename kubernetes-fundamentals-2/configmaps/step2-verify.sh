#!/bin/bash
have=`kubectl get configmap person-config -o jsonpath='{.data.name\.\first}'`
want="David"

if [ "$have" = "$want" ]; then
  echo "done"
  # exit 0
fi

echo "You should have ${have} you have ${want}"

