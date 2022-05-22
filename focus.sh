cat blocked.txt | sudo tee -a /etc/hosts > /dev/null
sudo dscacheutil -flushcache
sudo ifconfig en0 down
sudo ifconfig en0 up