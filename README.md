# Remote Jupyter Notebook

These scripts allow for a remote jupyter instance to be launched and then port fowarded to your machine.  The SSH forwarding allows the remote jupyter notebook to be accessed at localhost:22222/tree.

## Manual Setup
1. Place the start_jupyter and the stop_jupyter on the remote server and update the path in the remote-jupyter script.  
2. update all instances of <user> to the unix user that the script will be logging into the servers with and running the scripts
3. SSH keys must be setup to allow for login into the remote server without using a password
4. The jupyter notebook must be configured to use a password instead of a one-time key


*These are for my reference, but anyone is welcome to view and modify for their own use.*
