#!/bin/bash

# append blocked websites to /etc/hosts

cat "$(dirname -- "$0")/blocked.txt" | sudo tee -a /etc/hosts > /dev/null

# clear the dns cache 
sudo dscacheutil -flushcache

# restart the network service - so we don't have to restart our browser
sudo ifconfig en0 down
sudo ifconfig en0 up

SECONDS_LEFT=$(( ${1:-25} * 60 ))
HRS_LEFT=$(( ${1:-25} / 60 ))
MINS_LEFT=$(( ${1:-25} ))

while (( $SECONDS_LEFT >= 0 ))
do
    # capture ctrl-c
    trap 'bash "$(dirname -- "$0")/unfocus.sh"; exit 0' INT
    echo -ne "\033[K"
    echo -ne "\rFocus123! Sites will unblock in ${HRS_LEFT} Hours, ${MINS_LEFT} minutes (${SECONDS_LEFT} seconds..."
    sleep 1
    SECONDS_LEFT=$(( $SECONDS_LEFT - 1 ))
    # using new seconds value
    MINS_LEFT=$(( $SECONDS_LEFT / 60 ))
    HRS_LEFT=$(( $SECONDS_LEFT / 60 / 60 ))
done

bash "$(dirname -- "$0")/unfocus.sh"
