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

root_user_check () {
  if [ "$EUID" -ne "0" ]; then 
  whiptail --backtitle "$script" --title "$program" --msgbox "ROOT privileges are required to continue. Exiting..." 10 40
    exit 1
fi 
} 

# Display existing hostname 

show_current_hostname () { 
  whiptail --backtitle "$script" --title "$program" --msgbox "The current hostname is: $currenthost." 10 40
} 

# Ask for new hostname $newhost 

get_new_hostname () { 
  newhost=$(whiptail --backtitle "$script" --title "$program" --inputbox "Enter new hostname:" 10 40 3>&1 1>&2 2>&3)
  
  exitstatus=$?

  if [ $exitstatus = 0 ]; then
    printf "%s\n" "$newhost" 
  else
    printf "%s\n" "Canceling..."
    exit 1 
fi
} 

# Change hostname in /etc/hosts & /etc/hostname

change_hostname () {
  whiptail --backtitle "$script" --title "$program" --msgbox "Changing hostname" 10 40 
  
  sed --in-place "s/$currenthost/$newhost/g" /etc/hosts
  sed --in-place "s/$currenthost/$newhost/g" /etc/hostname 
} 

# Display new hostname 

show_new_hostname () {
  whiptail --backtitle "$script" --title "$program" --msgbox "Your new hostname is $newhost" 10 40 
} 

# Reboot now or later? 

rebooty () { 
  if (whiptail --backtitle "$script" --title "$program" --yesno "A reboot is required for changes to take effect. Reboot now?" 10 40) ; then 
    reboot
  else 
    exit 1
fi

exit 0 
} 

# Main 

root_user_check 

main () { 
  show_current_hostname
  get_new_hostname
  change_hostname 
  show_new_hostname
  rebooty 
}

main "$@" 
