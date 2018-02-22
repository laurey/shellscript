#!/bin/bash
while true
    do
        read -p "PLS enter one pid :" pid
        echo -e "you enter pid is : $pid \n"

        read -p "Update your APT packages(Y/n):" _update
        echo -e "enter is : $_update \n"
        # 将输入转换为大写
        _update=${_update^^}
        echo -e "the input update in uppercase: $_update \n"

        if [ "$_update" != "N" ] && [ "$_update" != "n" ]; then
            _update="Y"
        else
            _update="N"
        fi

        update_cmd="sudo apt-get update"
        echo $update_cmd
    break
done
echo -e "\n=====================N=O=T======================\n"
