#!/bin/bash
#desc: file if exists

if [[ -e ttd/r.sh ]]; then
	echo "OK, exists"
else
    echo "not exists"
fi
