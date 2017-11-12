#!/bin/bash 
# ROOT privilege check w/Whiptail 

# Assign name of script 
script_name=`basename "$0"`

# Assign 0 to root_uid 
root_uid=0 

# Exit if not root
if [ "$UID" -ne "$root_uid" ]; then 
    whiptail --msgbox --backtitle "$script_name" "ROOT privileges are required to continue. Exiting." 10 40
    exit 1
fi 

