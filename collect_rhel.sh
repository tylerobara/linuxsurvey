#!/bin/bash
#mkdir -pv /home/student/joseph.obara

#1a - collect date
get_date(){
    date
}
#1b - how many users are logged in
get_users_logged_in(){
    who | wc -l
}
#1c - how did the users login
get_login_method(){
    sudo netstat -pant
}
#1d - collect hostname
get_hostname(){
    hostnamectl --static
}
#1e - what dns servers are configure
get_dns_serv1(){
    sudo cat "/etc/resolv.conf" | grep names | cut -d' ' -f2
}
get_dns_serv2(){
    sudo cat "/etc/sysconfig/network-scripts/"ifcfg-* | grep -i dns
}
#1f - what scheduled tasks are configured to run
get_sched_tasks='sudo cat /etc/crontab'

#1g - any connected share
get_shares='sudo cat /etc/fstab'

#1h - how many accounts are on the system
get_num_accounts='sudo cat /etc/passwd | wc -l'

#1i - who has root privileges
get_root1='sudo cat /etc/passwd'
get_root2='sudo cat /etc/group'
get_root3='sudo cat /etc/sudoers'

#1j - where are the kernel logs stored
get_kern_log='cat /etc/rsyslog.conf'

#1k - who can alter the kernel log file
#get_kern_log_user='sudo ls -lah /var/log/messages | awk -F' ' '{ print $2,$3}''

hostname=$(get_hostname)
out="/home/student/joseph.obara/sysinfo_$hostname.txt"

cmds=( get_date get_hostname get_users_logged_in get_dns_serv1 get_dns_serv2)
printf "%40s\n" "################### This is a collection of info from the $hostname system ###################" >> $out
for i in "${cmds[@]}";
    do
    printf "%40s\n" "################### $i ###################">> $out
    $i >> $out
    printf "%40s\n" >> $out
    done
printf "%40s\n\n" "#################### This is the end of the collection ######################" >> $out