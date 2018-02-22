#!/bin/bash
#desc: 计算程序执行用时时间
#date: 7.22.2016
#author: luis

x=1
y=0
while true
    do
        if [ $1 -a -e $1 ]; then
            videopath=$1
        else
            read -p "PLS write your video path: " videopath
        fi

        if [ $videopath -a -e $videopath ]; then
            echo -e "$videopath is exists"
        elif [ $x -gt 5 ]; then
            echo -e "Are you kidding me????? \nI Quit!!!!"
            exit 1
        else
            echo "the $videopath is not exists"
            x=$[x + 1]
            # x=$(($x + 1)) 计算结果同上一行
            continue
        fi


        op=$(date +%s)
        outputfile="~/Desktop/"$(date +%Y%m%d%H%M%S)".png"

        command="ffmpeg -ss 1 -i $videopath -y -f image2 -s 720x480 -vframes 1 -an $outputfile"
        echo $command
        eval $command

        ed=$(date +%s)
        y=$[ed - op]
        echo "time usage:" $y
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
