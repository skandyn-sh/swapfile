#!/bin/bash
echo "This script creates and activates a swap file 1GB (path: /swapfile) and then adds it to /etc/fstab"
echo "Please enter your sudo password"
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile   
sudo sh -c 'echo "/swapfile swap swap defaults 0 0" >> /etc/fstab'
echo
echo "We make sure it works"
echo
free -m
echo
echo "Your swap file is ok"   
exit 
