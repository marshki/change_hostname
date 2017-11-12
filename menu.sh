#!/bin/bash 
# Changes hostname in Ubuntu.  

#Globals 
script=`basename "$0"`              # Assign name of script
root_uid=0                          # Assign 0 to root_uid 
currenthost=$(cat /etc/hostname)    # Assign exiting hostname 

# Exit if not root
if [ "$UID" -ne "$root_uid" ]; then 
    whiptail --backtitle "$script" --msgbox "ROOT privileges are required to continue. Exiting." 10 40
    exit 1
fi 

# Display existing hostname 
whiptail --backtitle "$script" --msgbox "The current hostname is $currenthost." 10 40

# Ask for new hostname 
newhost=$(whiptail --backtitle "$script" --inputbox "Enter new hostname:" 10 40 3>&1 1>&2 2>&3)
                                                            
exitstatus=$?
if [ $exitstatus = 0 ]; then
    read $newhost 
    printf "$s\n" "User entered: $newhost" 
else
    printf "$s\n" "Canceling..."
    exit 1 
fi

#change hostname in /etc/hosts & /etc/hostname 

# Display new hostname 

# Press a key to reboot 
