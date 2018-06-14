#!/bin/bash
# mjk 2017.11.18

############################################
### Change hostname in Ubuntu,           ###
### and probably other Debian-based OSs. ###
### Text-based user interface (TUI)      ###
### via Whiptail.                        ###
############################################

# Assign script name, program name
 
script=`basename "$0"`              
program="Change Hostname"    	        
  
# Assign exisitng hostname 

currenthost=$(cat /etc/hostname)

# Exit if not root

if [ "$EUID" -ne "0" ]; then 
    whiptail --backtitle "$script" --title "$program" --msgbox "ROOT privileges are required to continue. Exiting..." 10 40
    exit 1
fi 

# Display existing hostname 

whiptail --backtitle "$script" --title "$program" --msgbox "The current hostname is: $currenthost." 10 40

# Ask for new hostname 
newhost=$(whiptail --backtitle "$script" --title "$program" --inputbox "Enter new hostname:" 10 40 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    printf "%s\n" "$newhost" 
else
    printf "%s\n" "Canceling..."
    exit 1 
fi

# Change hostname in /etc/hosts 
sed -i "s/$currenthost/$newhost/g" /etc/hosts

# Change hostname in /etc/hostname 
sed -i "s/$currenthost/$newhost/g" /etc/hostname 

# Display new hostname 
whiptail --backtitle "$script" --title "$program" --msgbox "Your new hostname is $newhost" 10 40 

# Reboot now or later? 
if (whiptail ==backtitle "$script" --title "$program" --yesno "A reboot is required for changes to take effect. Reboot now?" 10 40) ; then 
    reboot
else 
    exit 1

exit 0 
