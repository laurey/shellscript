#!/bin/bash
while true
do
    read -p "PLS enter one pid :" pid
    echo -e "you enter pid is : $pid \n"
    read -p "Update your APT packages(Y/N):" _update
    if [ "$_update" != "N" ] && [ "$_update" != "n" ]; then
        _update="Y"
    else
        _update="N"
    fi
    echo -e "enter is : $_update \n"
break
done
