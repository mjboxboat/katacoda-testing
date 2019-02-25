#!/bin/bash
have=`kubectl get configmap multi-config -o=jsonpath='{.data.hometown}'`
want="Glen Cove"

if [ "$have" = "$want" ]; then
  echo "done"
  # exit 0
fi

echo "You should have ${have} you have ${want}"

