#!/bin/bash

ip=( '131' '171' '172' '134' '170' "$1")

for i in "${ip[@]}"
    do
    if [ $server = 'class20-06.ddns.net' ]
		then 
		ssh student@class20-06.ddns.net 'bash -s' collectspecial.sh
		scp student@class20-06.ddns.net:/home/student/joseph.obara/sysinfospecial.sh .
		else
        ssh student@192.39.100.$i 'bash -s' < collect$i.ssh
        scp student@192.39.100.$i:/home/student/joseph.obara/"sysinfo$i".txt
        fi
        done


#!/bin/bash
server=$1

for i in {1..1};
	do
		if [ $server = 'class20-06.ddns.net' ]
		then 
		ssh student@class20-06.ddns.net 'bash -s' collectspecial.sh
		scp student@class20-06.ddns.net:/home/student/joseph.obara/sysinfospecial.sh .
		else
		echo "there is nothing else"
		fi
done