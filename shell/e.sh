#!/bin/bash

# if file($1) is exists
if test -e $1; then
    echo -e "$1 is exists"
else
    echo "$1 is not exists"
fi

# if file($2) is exists
if [ -e $2 ]; then
    echo -e "$2 is exists"
else
    echo "$2 is not exists"
fi
