#!/bin/bash
have=$(kubectl get pv local-pv -o=jsonpath='{.metadata.name}')
want="local-pv"

if [ "$have" = "$want" ]; then
  echo "done"
  # # exit 0
fi

echo "You should have ${have} you have ${want}"
# 
