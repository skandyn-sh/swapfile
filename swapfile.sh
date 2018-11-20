#!/bin/bash
echo "This script creates and activates a swap file (path: /swapfile) and then adds it to /etc/fstab"
echo "Please enter the swap file size, e.g. 1,2,4,8,16"
read d
case "$d" in
  "1") sudo dd if=/dev/zero of=/swapfile bs=1M count=1024 ;;
  "2") sudo dd if=/dev/zero of=/swapfile bs=1M count=2048 ;;
  "4") sudo dd if=/dev/zero of=/swapfile bs=1M count=4096 ;;
  "8") sudo dd if=/dev/zero of=/swapfile bs=1M count=8192 ;;
  "16") sudo dd if=/dev/zero of=/swapfile bs=1M count=16384 ;;
esac
  
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile   
sudo sh -c 'echo "/swapfile swap swap defaults 0 0" >> /etc/fstab'
echo
echo "We make sure it works"
echo
free -m
exit 
