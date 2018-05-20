#! /bin/bash
PID=$(pgrep -f 'ssh -q -f <user@IP_Address> -L 22222:localhost:22222 -N')
i=1

echo "******************Combat Landing Authorized*************************"
echo "Stopping Remote Notebook and SSH Tunnel"
sleep 1

ssh <user@IP_Address> "bash /home/<user>/scripts/stop_jupyter.sh" &
echo "Notebook Killed"

sleep 3

echo "Stopping SSH port forwarding"
echo $PID
sleep 1
if [[ $PID != "" ]]; then

	while [[ $PID != "" && $i < 3 ]]; do
		echo "Attempt: " && echo $i
 		echo "Running: " && echo $PID
		echo "Attempting to Killing PID"
		sleep 1
		pkill -f 'ssh -q -f <user@IP_Address> -L 22222:localhost:22222 -N'
		sleep 1
		((++i))
		PID=$(pgrep -f 'ssh -q -f <user@IP_Address> -L 22222:localhost:22222 -N')
	done

	if [ $i -ge 3 ]; then
		echo "*****Kill attempts on SSH PID Failed****"
		echo "*************Exiting Script*************"
		exit 2
	fi

else
	echo "SSH Tunnel PID not running"
fi 

if [[ $i > 1 ]]; then
	echo "Kill attempt successful"
fi

echo "******************Ready to Jump!************************************"