#!/bin/bash
# mjk 2017.11.18

############################################
### Change hostname in Ubuntu,           ###
### and probably other Debian-based OSs. ###
############################################

#Assign existing hostname to $hostn

currenthost=$(cat /etc/hostname)

#Exit if not ROOT. 

root_user_check () {
  if [ "$EUID" -ne "0" ]; then 
    printf "%s\n" "ROOT privileges are required to continue. Exiting.">&2
    exit 1
fi 
}

#Display existing hostname

show_current_hostname () {
  printf "%s\n" "Existing hostname is $currenthost"
}

#Ask for new hostname $newhost

get_new_hostname () { 
  printf "%s\n" "Enter new hostname: "
  read -r newhost
} 

#Change hostname in /etc/hosts & /etc/hostname

change_hostname () { 
  sed --in-place "s/$currenthost/$newhost/g" /etc/hosts
  sed --in-place "s/$currenthost/$newhost/g" /etc/hostname
} 

#Display new hostname

show_new_hostname () { 
  printf "%s\n" "Your new hostname is $newhost"
} 

#Press a key to reboot

rebooty () { 
  read -s -n 1 -rp "Press any key to reboot"
  reboot  
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
