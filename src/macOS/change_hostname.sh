#!/usr/bin/env bash
# 
# change_hostname
# 
# Change hostname in macOS.
#
# Author: M. Krinitz <mjk235 [at] nyu [dot] edu>
# Date: 27-DEC-2023
# License: MIT
#

# Assign existing hostname to $currenthost.

currenthost=$(scutil --get ComputerName)

# Exit if not ROOT.

root_user_check () {
  if [ "$EUID" != "0" ]; then
    printf "%s\n" "ROOT privileges are required to continue. Exiting.">&2
    exit 1
fi
}

# Display existing hostname.

show_current_hostname () {
  printf "%s\n" "Existing hostname is: $currenthost"
}

# Ask for new hostname $newhost.

get_new_hostname () { 
  printf "%s\n" "Enter new hostname: "
  read -r newhost
} 

# Change hostname via 'scutil'.

change_hostname () {
  scutil --set ComputerName $newhost
  scutil --set HostName $newhost
  scutil --set LocalHostName $newhost
  unset $newhost
} 

# Display new hostname.

show_new_hostname () { 
  printf "%s\n" "Your new hostname is $newhost"
} 

# Press a key to reboot.

rebooty () {
  read -s -n 1 -rp "Press any key to reboot"
  reboot
}

# Main.

root_user_check

main () {
  show_current_hostname
  get_new_hostname
  change_hostname
  show_new_hostname 
  rebooty
}

main "$@"
