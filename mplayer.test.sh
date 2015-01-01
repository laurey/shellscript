#!/bin/bash
set -u

x=0
while true
    do
        if [[ -e $1 ]]; then
            videopath=$1
        else
            read -p "PLS write your video path: " videopath
        fi

        if [ -e $videopath ]; then
            echo -e "$videopath is exists"
        elif [ $x -gt 5 ]; then
            echo -e "are you kidding me?????"
            exit 1
        else
            echo "$videopath is not exists"
            x=$(($x + 1))
            continue
        fi
        
        # 输出视频文件基本信息 
        # mediainfo MY.TEST.VIDEO.mp4
        
        # 输出音频文件时长和比特率
        # mediainfo --Inform="Audio;%Duration% %BitRate%" MY.TEST.AUDIO.mp3

        # example
        # mplayer -identify -nosound -vc dummy -vo null MY.TEST.VIDEO.mp4
        /usr/bin/mplayer -identify -nosound -vc dummy -vo null $videopath
       break
done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<< \n"
