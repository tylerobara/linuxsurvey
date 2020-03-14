#!/bin/bash

#1a - collect date
date

#1b - how many users are logged in
who | wc -l

#1c - how did the users login
sudo netstat -pant

#1d - collect hostname
hostname

#1e - what dns servers are configuire
sudo cat /etc/resolve.conf
sudo cat /etc/sysconfig/network-scripts/ifcfg-* | grep dns

#1f - what scheduled tasks are configured to run
sudo cat /etc/crontab

#1g - any connected share
sudo cat /etc/fstab

#1h - how many accounts are on the system
sudo cat /etc/passwd | wc -l

#1i - who has root privileges
sudo cat /etc/passwd
sudo cat /etc/group
sudo cat /etc/sudoers

#1j - where are the kernel logs stored
cat /etc/rsyslog.conf | grep 'kern\|'*''

#1k - who can alter the kernel log file
sudo ls -lah /var/log/messages | awk -F' ' '{ print $2,$3}'



