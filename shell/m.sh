#!/bin/bash
#desc: array operate
#date: 10.17.15
#author: luis

function printList() {
    declare -a nameList=("A" "B" "C" "EE")
    for element in ${nameList[@]}
    do
        echo $element
        local one=$1
        local two=$2
        echo "the value of \$one is $one"
        echo "the value of \$two is $two"
    done
    exit 1
}

#call function
printList r 12 98
