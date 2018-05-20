#! /bin/bash
SSHPID=$(pgrep -f 'ssh -q -f <user@IP_Address> -L 22222:localhost:22222 -N')

echo "*****************Launch Vipers! Jupyter-Class Battlestar Galactica Reporting!!*************"

echo "Connecting to <IP_Address and launching notebook" 
sleep 1

#Remote Script checks for already running notebook and does not start second
ssh -t <user@IP_Address> "/home/<user>/scripts/start_jupyter.sh" &
echo "Remote notebook started on <IP_Address>" 

sleep 2

echo "Enabling SSH port forwarding" 
sleep 1
if [[ $SSHPID == "" ]]; then
	ssh -q -f <user@IP_Address> -L 22222:localhost:22222 -N &
else
	echo "Tunnel Already Created"
fi

echo "Notebook available at localhost:22222/tree or localhost:22222/lab"

echo "*****************Good Hunting!!*************"




