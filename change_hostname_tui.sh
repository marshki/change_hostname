#!/bin/bash
# Bash script to change hostname in Ubuntu 
# Text-based user interface (TUI)

# Variables 
script=`basename "$0"`              # Assign name of script
program="Change Hostname"    	    # Assign title of program  
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
    printf "%s\n" "$newhost" 
else
    printf "s%\n" "Canceling..."
    exit 1 
fi

# change hostname in /etc/hosts 
sed -i "s/$currenthost/$newhost/g" /etc/hosts

# change hostname in /etc/hostname 
sed -i "s/$currenthost/$newhost/g" /etc/hostname 

# Display new hostname 
whiptail --backtitle "$script" --title "$program" --msgbox "Your new hostname is $newhost" 10 40 

# Press a key to reboot 
reboot
