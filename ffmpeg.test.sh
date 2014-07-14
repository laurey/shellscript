#!/bin/bash
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
            echo -e "are you kidding me????? \nI QUIT!!!!"
            exit 1
        else
            echo "$videopath is not exists"
            x=$[x + 1]
            # x=$(($x + 1)) 计算结果同上一行
            continue
        fi

        # example 
        # ffprobe -v quiet -print_format json -show_format -show_streams XSZYH.mp3 > JSON.XIAO.SA.mp3.infolog
        # 输出JSON格式的MP3文件信息
        # !!!select one video stream and copy them to an output file
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -map 0 -b:a 128k -acodec -id3v2_version 3 -ar 44100 -vn test.mp3
        # ffmpeg -i test.mp3 -ar 44100 -map  0:a -b:a 128K -id3v2_version 3 t.mp3
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -f mp4 -map 0:a -b:a 128k -ar 44100 -acodec mp3 -vn -t 250 test.mp3
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -f mp4 -map 0:a -b:a 128k -bufsize 128k -ar 44100 -codec:a libmp3lame -vn test2.mp3
        outputfile="~/Desktop/"$(date +%Y%m%d%H%M%S)".mp3"
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -f mp4 -map 0:a -b:a 128k -bufsize 128k -ar 44100 -codec:a -vn test2.mp3
        # command="ffmpeg -i $videopath -f mp4 -map 0:a -b:a 128k -bufsize 128k -id3v2_version 3 -ar 44100 -acodec libmp3lame -vn $outputfile"
        command="ffmpeg -i $videopath -f mp4 -map 0:a -b:a 128k -id3v2_version 3 -ar 44100 -vn $outputfile"
        echo $command
        eval $command
       break
    done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
