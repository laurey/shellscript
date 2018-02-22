#!/bin/bash
#desc   : 截取指定时长的视频片段
#author : luis
#date   : 02.15.2015
set -x

ss=571
t=50

while true
    do
        if [ -n "$1" ]; then
            videopath=$1
        else
            read -p "PLS write your video path: " videopath
        fi

        if [ -e "$videopath" ]; then
            echo -e "$videopath is exists"
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
        # ffmpeg -i 想要拥抱你.Dakishimetai.Chi_Jap.BDrip.1024X552-YYeTs人人影视.mkv -ss 3685 -c:v copy -c:a -c copy -t 1850 Da.1.mkv
        # ffmpeg -i 想要拥抱你.Dakishimetai.Chi_Jap.BDrip.1024X552-YYeTs人人影视.mkv -ss 3685 -c:v copy -c:a -c copy -t 1850 Da.1.mkv

        outputfile="~/Desktop/"$(date +%Y%m%d%H%M%S)".mp4"
        # command="ffmpeg -i $videopath -ss $ss -c:v -c:a copy -c copy -b:a 128k -t $t $outputfile"
        # command="ffmpeg -i \"$videopath\" -ss $ss -c:v copy -c:a copy -b:a 128k -s 1024x768 -t $t $outputfile"
        command="ffmpeg -i \"$videopath\" -vcodec copy -acodec copy -ss $ss -t $t $outputfile"
        echo $command
        eval $command
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
