#!/bin/bash
display_usage() { 
	echo "This script requires three arguments:" 
	echo -e "     ./master_collector.sh {server} {username}"
    echo -e "     eg: ./master_collector.sh class20-06.sh john.smith \n"  
	} 
# if less than three arguments supplied, display usage 
	if [  $# -le 3 ] 
	then 
		display_usage
		exit 1
	fi 
 
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

server=$1
user_path="/home/student/$2"
#sed -i "3s/.*/\#$mkdir_path/" collect_rhel.sh
#removed ips for testing ('131' '171' '172' '134' '170')
ip=( "$1" )

for i in "${ip[@]}"
    do
    if [ $server = 'class20-06.ddns.net' ]
		then
        printf "SCPing the script to the $server system\n"
        ssh -t student@class20-06.ddns.net "mkdir $user_path" 2>/dev/null
        scp -q collect_rhel.sh student@class20-06.ddns.net:$user_path
        printf "SSHing to the $server system\n" 
		echo ST@dm1n! | ssh -tt -q student@class20-06.ddns.net "sudo -s bash $user_path/collect_rhel.sh" 2>/dev/null
        printf "SCPing the results from the $server system\n" 
		scp -q student@class20-06.ddns.net:$user_path/sysinfo_*.txt .
        echo ST@dm1n! | ssh -tt -q student@class20-06.ddns.net "sudo -s rm -rf $user_path" 2>/dev/null
		else
        ssh -t student@192.39.100.$i 'bash -s' < collect$i.sh
        scp student@192.39.100.$i:/home/student/joseph.obara/"sysinfo$i".txt .
        fi
        done