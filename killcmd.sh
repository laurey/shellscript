#!/bin/bash
while true
do
    read -p "PLS enter the cmd :" pid
    echo -e "you enter is : $pid \n"
    # example 
    # ps aux | grep COMMAND | grep -v 'grep' | awk '{print $2}' | xargs kill
    ps aux | grep $pid | grep -v 'grep' | awk '{print $2}' | xargs kill
    echo $?
break
done
