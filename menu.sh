#!/bin/bash 
# Changes hostname in Ubuntu.  

# Assign name of script
scriptname=`basename "$0"`

# Assign exiting hostname
currenthost=$(cat /etc/hostname)

# Whiptail message box 
whiptail --msgbox --backtitle "$scriptname" "The current hostname is $currenthost" 10 40
