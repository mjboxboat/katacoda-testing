#!/bin/bash
have=$(kubectl get po -o=jsonpath='{.items}')
want="[]"

if [ "$have" = "$want" ]; then
  echo "done"
  # # exit 0
fi

echo "You should have ${have} you have ${want}"
# 
