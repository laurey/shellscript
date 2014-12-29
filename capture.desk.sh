#!/bin/bash
# desc: use ffmpeg command line capture desktop
# author : luis
x=1
home=$HOME

while true
    do
        if [ $1 -a -e $1 ]; then
            videopath=$1
        else
            read -p "PLS write your video save path:(default: $home) " videopath
        fi

        if [ $videopath -a -e $videopath ]; then
            echo -e "$videopath is exists"
        elif [ -z $videopath ]; then
            videopath=$home
        elif [ $x -gt 5 ]; then
            echo -e "Are you kidding me????? \nI QUIT!!!!"
            exit 1
        else
            echo "$videopath is not exists"
            x=$[x + 1]
            # x=$(($x + 1)) 计算结果同上一行
            continue
        fi

        # example 
        # ffmpeg -report -s 1280x720 -vframes 25 -f x11grab -i :0.0+0,0 output-5721.mp4 
        output=$videopath"/output-"$(date +%Y%m%d%H%M%S)".mp4"

        command="ffmpeg -report -s 1280x720 -vframes 25 -f x11grab -i :0.0+0,0 $output"
        echo $command
        eval $command
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
