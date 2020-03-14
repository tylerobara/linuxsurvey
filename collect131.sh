#!/bin/bash

#collect date
date

#how many users are logged in
who | wc -l

#how did the users login
sudo netstat -pant

#collect hostname
hostname

#what dns servers are configuire
sudo cat /etc/resolve.conf
sudo cat /etc/sysconfig/network-scripts/ifcfg-* | grep dns

#

