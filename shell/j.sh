#!/bin/bash

#program:
#    shell function
#date:08.23.14
#author:luis

function hello() {
    echo -e "hello world!\r\n"
    exit 1
}

function printline() {
    declare -a strlist=(example for line in cat rxx.sh)
##  strlist=(for line in cat xxx.sh)
    for idx in ${strlist[*]}
        do
            echo "idx:" ${idx}
        done
    exit 2
}

#execute function
#hello
printline
