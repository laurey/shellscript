#!/bin/bash
#desc:
#   视频剪切 & 视频截图
#date: 08.24.2014
#author: luis

x=1
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


        # example 
        # 提取视频文件中的部分 
        # ffmpeg -ss 00:09:03 -i They-Don\'t-Care-About-Us.mp4 -map 0 -b:a 128k -acodec copy -vcodec copy -t 00:05:55 fragment.mp4
        #
        # example 
        # 将视频中任意一帧保存为指定宽高图片 
        # ffmpeg -ss 89 -i They-Don\'t-Care-About-Us.mp4 -y -f image2 -s 1280x720 -vframes 1 -an snap1.png 
        #
        # 将视频中起始时间为M的N帧保存为指定宽高的N张图片 
        # ffmpeg -ss 89 -i They-Do-not-Care-About-Us.mp4 -y -f image2 -s 1280x720 -vframes 100 -an snap-%03d.png 
        #
        #
        # 将视频中N帧保存为指定宽高的GIF动画 
        # ffmpeg -i yourvideopath -vframes N -y -f gif -s widthxheight -an outputfilename
        # ffmpeg -ss 550 -i Dragon.Ball.Kai.mp4 -vframes 188 -y -f gif -s 1280x720 -an animate.gif

        outputfile="~/Desktop/"$(date +%Y%m%d%H%M%S)".png"
        # command="ffmpeg -ss 199 -i $videopath -y -f image2 -s 720x480 -vframes 1 -an $outputfile"

        command="ffmpeg -ss 199 -i $videopath -y -f image2 -s 720x480 -vframes 1 -an $outputfile"
        echo $command
        eval $command
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
