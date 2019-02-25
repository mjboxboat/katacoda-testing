#!/bin/bash
have=`kubectl logs alpine-all-vars`
want="David"

if [ "$have" = "$want" ]; then
  echo "done"
  # exit 0
fi

echo "You should have ${have} you have ${want}"

