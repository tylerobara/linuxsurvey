#!/bin/bash
server=$1
#removed ips for testing ('131' '171' '172' '134' '170')
ip=( "$1" )

for i in "${ip[@]}"
    do
    if [ $server = 'class20-06.ddns.net' ]
		then
        printf "SCPing the script to the $server system\n"
        ssh -t student@class20-06.ddns.net 'mkdir /home/student/joseph.obara'
        scp collect131.sh student@class20-06.ddns.net:/home/student/joseph.obara/
        printf "SSHing to the $server system\n" 
		echo ST@dm1n! | ssh -tt student@class20-06.ddns.net "sudo -s bash /home/student/joseph.obara/collect131.sh"
        printf "SCPing the results from the $server system\n" 
		scp student@class20-06.ddns.net:/home/student/joseph.obara/sysinfo131.txt .
        echo ST@dm1n! | ssh -tt student@class20-06.ddns.net "sudo -s rm -rf /home/student/joseph.obara/"

		else
        ssh -t student@192.39.100.$i 'bash -s' < collect$i.sh
        scp student@192.39.100.$i:/home/student/joseph.obara/"sysinfo$i".txt .
        fi
        done