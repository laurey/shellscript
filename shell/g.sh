#!/bin/bash
x=1
while true
    do
        if [ $1 -a -e $1 ]; then
            videopath=$1
        else
            read -p "PLS write your video path: " videopath
        fi

        if [ -e $videopath ]; then
            echo -e "$videopath is exists"
        elif [ $x -gt 3 ]; then
            echo -e "are you kidding me?????"
            exit 1
        else
            echo "$videopath is not exists"
            x=$(($x + 1))
            continue
        fi
        
        # example
        # mplayer -identify -nosound -vc dummy -vo null MY.TEST.VIDEO.mp4
        /usr/bin/mplayer -identify -nosound -vc dummy -vo null $videopath
       break
done
echo -e "\n>>>>>>>>>>>>>>>>>>>>>>>>It is Over.<<<<<<<<<<<<<<<<<<< \n"
