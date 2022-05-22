grep -Fvxf "$(dirname -- "$0")/blocked.txt" /etc/hosts | sudo tee /etc/hosts > /dev/null
sudo dscacheutil -flushcache
sudo ifconfig en0 down
sudo ifconfig en0 up
echo -ne "\nTime to relax. Sites unblocked.\n"