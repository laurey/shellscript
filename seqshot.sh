#!/bin/bash
#desc:
#   从第ss秒随机视频截图n张
#date: 08.24.2014
#author: luis
set -x

x=1
ss=10
while true
    do
        if [[ -z $1 ]] || [[ ! -e $1 ]]; then
            read -p "PLS write your video path: " videopath
        else
            videopath=$1
        fi

        if [[ -e $videopath ]]; then
            echo -e "$videopath is exists"
        elif [[ $x -gt 5 ]]; then
            echo -e "Are you kidding me????? \nI Quit!!!!"
            exit 1
        else
            echo "the $videopath is not exists"
            x=$[x + 1]
            continue
        fi

        if [[ -z $2 ]]; then
            read -p "PLS write the num you wish snap: " input
        else
            input=$2
        fi

        if [[ $input =~ [^0-9$] ]]; then
            echo -e 'invalid input value : ' $input
            exit 3;
        fi

        if [[ -z "$input" ]] || [[ $input -le 0 ]]; then
            input=5
        elif [[ $input -gt 50 ]]; then
            input=20
        fi

        if [[ -z $3 ]] || [[ ! -d $3 ]]; then
            read -p "PLS write your destination path: " outpath
        else
            outpath=$3
        fi

        if [[ ! -d $outpath ]]; then
            echo -e 'not exist destination directory: ' $outpath
            exit 4;
        fi

        # get video width & height
        width=$(/usr/bin/mediainfo --Inform="Video;%Width%" $videopath)
        height=$(/usr/bin/mediainfo --Inform="Video;%Height%" $videopath)

        if [[ $width -le 0 ]]; then
            echo 'no width. width => ' ${width}
            exit 5
        fi
        
        if [[ $height -le 0 ]]; then
            echo 'no height. height => ' ${height}
            exit 6;
        fi

        for i in $(seq $input);
            do
                rand=$(shuf -i 2-27 -n 1)
                ss=$[i * rand + 100]
                # example 
                # 将视频中任意一帧保存为指定宽高图片 
                outputfile=${outpath}$(date +%Y%m%d%H%M%S)"-"$i".png"
                # command="ffmpeg -ss 188 -i $videopath -y -f image2 -s 720x480 -vframes 1 -an $outputfile "

               command="nohup ffmpeg -ss $ss -i $videopath -y -f image2 -s ${width}x${height} -vframes 1 -an $outputfile "
               echo $command
               eval $command
       done
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
