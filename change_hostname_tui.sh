#!/bin/bash
# Changes hostname in Ubuntu.  

# Assign Variables 
script=`basename "$0"`              # Assign name of script
program="Change Hostname"    	    # Assign title 
root_uid=0                          # Assign 0 to root_uid 
currenthost=$(cat /etc/hostname)    # Assign existing hostname 

# Exit if not root
if [ "$UID" -ne "$root_uid" ]; then 
    whiptail --backtitle "$script" --title "$program" --msgbox "ROOT privileges are required to continue. Exiting." 10 40
    exit 1
fi 

# Display existing hostname 
whiptail --backtitle "$script" --title "$program" --msgbox "The current hostname is $currenthost." 10 40

# Ask for new hostname 
newhost=$(whiptail --backtitle "$script" --title "$program" --inputbox "Enter new hostname:" 10 40 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    printf "%s\n" "$newhost
else
    printf "s%\n" "Canceling..."
fi

# change hostname in /etc/hosts 
sed 

# change hostname in /etc/hostname 



# Display new hostname 

# Press a key to reboot 
