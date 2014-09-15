#!/bin/bash
#desc:
#   从第10秒随机视频截图5张
#date: 08.24.2014
#author: luis

x=1
ss=10
input=0
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

        if [[ -z "$2" ]]; then
            read -p "PLS write the num you wish snap: " input
        else
            input=$2
        fi

        if [[ -z "$input" ]] || [ $input -lt 0 ]; then
            input=5
        elif [ $input -gt 50 ]; then
            input=20
        fi

        # get video width & height
        width=$(/usr/bin/mediainfo --Inform="Video;%Width%" $videopath)
        height=$(/usr/bin/mediainfo --Inform="Video;%Height%" $videopath)
        if [ $width -lt 0 ]; then
            echo 'no width'
            exit 2
        fi
        
        if [ $height -lt 0 ]; then
            echo 'no height'
            exit 3;
        fi

        for i in $(seq $input);
            do
                ss=$[i * 20 + 100]
                # example 
                # 将视频中任意一帧保存为指定宽高图片 
                outputfile="~/Desktop/"$(date +%Y%m%d%H%M%S)"-"$i".png"
                # command="ffmpeg -i $videopath -ss 188 -y -f image2 -s 720x480 -vframes 1 -an $outputfile"

               command="nohup ffmpeg -i $videopath -ss $ss -y -f image2 -s ${width}x${height} -vframes 1 -an $outputfile &"
               echo $command
               #eval $command
       done
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
