#!/bin/bash

#EXAMPLE 1
#cat g.sh | while read line
#    do
#        echo $line
#    done
#exit 1

#EXAMPLE 2
#for line in `cat g.sh`
while read linea lineb linec lined
    do
        echo "linea:" $linea
        echo "lineb:" $lineb
        echo "linec:" $linec
        echo "lined:" $lined
    done < g.sh
exit 1
