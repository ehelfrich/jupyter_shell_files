#! /bin/bash


PID=$(pgrep -f "jupyter-notebook")
	i=1
	echo "Stopping Remote Jupyter Notebook Processes"
	sleep 1

	if [[ $PID != "" ]]; then
		while [[ $PID != "" && $i < 3 ]]; do
			echo "Attempt: " && echo $i
	 		echo "Running: " && echo $PID
			echo "Attempting to Killing PID"
			sleep 1
			pkill -f "jupyter-notebook"
			sleep 1
			((++i))
			PID=$(pgrep -f "jupyter-notebook")
		done

		if [ $i -ge 5 ]; then
			echo "*****Kill attempts on Jupyter-notebook PID Failed****"
			echo "*************Exiting Script*************"
			exit 2
		fi

	else
		echo "Jupyter-notebook not running"
	fi 

	if [[ $i > 1 ]]; then
		echo "Kill attempts successful"
	fi

