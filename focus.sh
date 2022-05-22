#!/bin/bash

# play lofi radio if -m passed in
while getopts "m" o; do
    case "${o}" in
        m)
            echo -e "Loading lo-fi radio"
            open https://www.youtube.com/watch?v=5qap5aO4i9A
            sleep 5
    esac
done


# append blocked websites to /etc/hosts
cat blocked.txt | sudo tee -a /etc/hosts > /dev/null

# clear the dns cache 
sudo dscacheutil -flushcache

# restart the network service - so we don't have to restart our browser
sudo ifconfig en0 down
sudo ifconfig en0 up

SECONDS_LEFT=$(( ${1:-25} * 60 ))
while (( $SECONDS_LEFT >= 0 ))
do
    # capture ctrl-c
    trap 'bash ./unfocus.sh; exit 0' INT
    echo -ne "\033[K"
    echo -ne "\rFocus! Sites will unblock in ${SECONDS_LEFT} seconds..."
    sleep 1
    SECONDS_LEFT=$(( $SECONDS_LEFT - 1 ))
done

bash ./unfocus.sh

