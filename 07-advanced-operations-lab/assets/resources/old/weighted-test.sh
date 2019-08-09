#!/bin/bash

for i in {1..10}
do
    curl -s weighted.algo | grep nginx- | awk -F '>' '{print $5}' | awk -F '<' '{print$1}'
done