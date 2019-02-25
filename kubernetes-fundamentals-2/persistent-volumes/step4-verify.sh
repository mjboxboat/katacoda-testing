#!/bin/bash
have=$(kubectl get po nginx-persist -o=jsonpath='{.status.phase}')
want="Running"

if [ "$have" = "$want" ]; then
  echo "done"
  # # exit 0
fi

echo "You should have ${have} you have ${want}"
# 
