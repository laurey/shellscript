#!/bin/bash

#program:
#    case 判断
#    function args & local variables 
#date: 08.24.14
#author: luis

function fn_case() {
    local w=$1
    local x=$2
    local y=$3
    local z=$(($x * $y))
    echo "the value of \$z is $z"
    echo "the value of \$x is $x"
    echo "the value of \$y is $y"
    case $w in
        'a')
            echo 'the value of $w is a'
        ;;
        'b')
            echo 'the value of $w is b'
        ;;
        'c')
            echo 'the value of $w is c'
        ;;
        'd')
            echo 'the value of $w is d'
        ;;
        'e')
            echo 'the value of $w is e'
        ;;
        *)
            echo 'the value of $w is' $w
        ;;
    esac
    exit 1
}

#call function
fn_case r 12 98
#fn_case a 13 4
