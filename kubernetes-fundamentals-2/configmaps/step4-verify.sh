#!/bin/bash
have=`kubectl logs alpine-test-pod | grep --color=NEVER FIRST_NAME`
want="FIRST_NAME=David"

if [ "$have" = "$want" ]; then
  echo "done"
  # exit 0
fi

echo "You should have ${have} you have ${want}"

