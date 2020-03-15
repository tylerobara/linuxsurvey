# linuxsurvey
survey and analyze a linux machine

``master_collector.sh``
The master_collector.sh file will scp the script(s) to be run on the remote machine, run the scripts, scp the results back to the client and delete the script from the remote system.


``collect{x}.sh``
The collect{x}.sh file is configured to run specific commands on the remote system based on pre-determined variables.
