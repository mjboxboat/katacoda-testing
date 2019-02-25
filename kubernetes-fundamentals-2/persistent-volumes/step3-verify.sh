#!/bin/bash
have=$(kubectl get pvc nginx-pvc -o=jsonpath='{.status.phase}')
want="Bound"

if [ "$have" = "$want" ]; then
  echo "done"
  # # exit 0
fi

echo "You should have ${have} you have ${want}"
# 
