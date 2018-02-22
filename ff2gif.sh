#!/bin/bash
#desc:
#   视频截图并保存为GIF格式
#date: 01.05.2015
#author: luis
set -x

x=1
ss=200
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
            continue
        fi

        if [ -z $2 ]; then
            read -p "PLS input the start time you wish snap: " ss
        else
            ss=$2
        fi

        if [ -z $ss -o $ss =~ [^[:digit:]$] -o $ss -le 0]; then
            echo -e 'invalid input value : ' $ss
            exit 3;
        fi

        # 将视频中N帧保存为指定宽高的GIF动画 
        # ffmpeg -i yourvideopath -vframes N -y -f gif -s widthxheight -an outputfilename
        # ffmpeg -ss 550 -i Dragon.Ball.Kai.mp4 -vframes 188 -y -f gif -s 1280x720 -an animate.gif
        # ffmpeg -ss 50 -i Dragon.Ball.Kai.mp4 -y -f gif -pix_fmt rgb8 -r 15 -s 1280x720 -t 10 -an animate.gif

        outputfile="~/Desktop/"$(date +%Y%m%d%H%M%S)".gif"
        command="ffmpeg -ss $ss -i $videopath -y -f gif -s 720x480 -an -pix_fmt rgb8 -r 15 -t 10 $outputfile"
        echo $command
        #eval $command
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
