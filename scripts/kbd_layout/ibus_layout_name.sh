#!/bin/bash

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
	echo "US"
elif [[ `ibus engine | awk -F":" '{ print $2 }'` == "de" ]]; then
	echo "DE"
else
    echo "CH"
fi
