#!/bin/bash
x=0
while true
    do
        if [ -e $1 ]; then
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

        # example
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -map 0 -b:a 128k -acodec -id3v2_version 3 -ar 44100 copy -vn test.mp3
        # ffmpeg -i test.mp3 -ar 44100 -map  0:a -b:a 128K -id3v2_version 3 t.mp3
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -f mp4 -map 0:a -b:a 128k -ar 44100 -acodec copy -vn test.mp3
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -f mp4 -map 0:a -b:a 128k -ar 44100 -codec:a copy -vn test2.mp3
        # ffmpeg -i They-Don\'t-Care-About-Us.mp4 -f mp4 -map 0:a -b:a 128k -bufsize 128k -ar 44100 -codec:a copy -vn test2.mp3
        outputfile=$(date +%Y%m%d%H%M%S)".mp3"
        # /usr/bin/ffmpeg -i $videopath -identify -nosound -vc dummy -vo null $outputfile
        ffmpeg -i $videopath -identify -nosound -vc dummy -vo null $outputfile
       break
done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<<< \n"
