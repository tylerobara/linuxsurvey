#!/bin/bash
mkdir -pv joseph.obara
out="/home/student/joseph.obara/sysinfo131.txt"
#1a - collect date
date > $out

#1b - how many users are logged in
who | wc -l >> $out

#1c - how did the users login
sudo netstat -pant >> $out

#1d - collect hostname
hostname >> $out

#1e - what dns servers are configuire
sudo cat /etc/resolve.conf >> $out
sudo cat /etc/sysconfig/network-scripts/ifcfg-* | grep dns >> $out

#1f - what scheduled tasks are configured to run
sudo cat /etc/crontab >> $out

#1g - any connected share
sudo cat /etc/fstab >> $out

#1h - how many accounts are on the system
sudo cat /etc/passwd | wc -l >> $out

#1i - who has root privileges
sudo cat /etc/passwd >> $out
sudo cat /etc/group >> $out
sudo cat /etc/sudoers >> $out

#1j - where are the kernel logs stored
cat /etc/rsyslog.conf | grep 'kern\|'*'' >> $out

#1k - who can alter the kernel log file
sudo ls -lah /var/log/messages | awk -F' ' '{ print $2,$3}' >> $out



