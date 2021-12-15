#!/bin/bash
# This is a bash script to switch between git accounts rather than 
# having multiple hosts loaded at once in the config file
configfile="config"
echo "-----------------------------------"
head -4 ${configfile}
echo "-----------------------------------"
line_3=$(sed -n 3p ${configfile})
line_4=$(sed -n 4p ${configfile})
if [[ $line_3 =~ "#" ]]; then
   sed -i'.bak' "s|# IdentityFile ~/.ssh/id_ed25519|  IdentityFile ~/.ssh/id_ed25519|" /Users/bgould/.ssh/${configfile}
   sed -i'.bak' "s|  IdentityFile ~/.ssh/id_ibm_ed25519|# IdentityFile ~/.ssh/id_ibm_ed25519|" /Users/bgould/.ssh/${configfile}
   ssh-add -D
   ssh-add id_ed25519
else
   sed -i'.bak' "s|# IdentityFile ~/.ssh/id_ibm_ed25519|  IdentityFile ~/.ssh/id_ibm_ed25519|" /Users/bgould/.ssh/${configfile}
   sed -i'.bak' "s|  IdentityFile ~/.ssh/id_ed25519|# IdentityFile ~/.ssh/id_ed25519|" /Users/bgould/.ssh/${configfile}
   ssh-add -D
   ssh-add id_ibm_ed25519
fi
echo "-----------------------------------"
head -4 ${configfile}
echo "-----------------------------------"
