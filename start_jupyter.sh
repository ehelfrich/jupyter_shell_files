#! /bin/bash
PID=$(ps -ef | grep -v grep | grep jupyter-notebook)

pgrep jupyter &
if [[ $PID != "" ]]; then
	echo "Jupyter is already running!"
else
	( /home/<user>/anaconda3/bin/jupyter notebook --no-browser --port=22222 & )
fi
