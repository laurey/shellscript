#!/bin/bash

declare -a strlist=(for line in cat rxx.sh)
##  strlist=(for line in cat xxx.sh)
for idx in ${strlist[*]}
    do
        echo "idx:" ${idx}
    done
exit 1
