#!/bin/bash 

newhost=$(whiptail --backtitle "$script" --inputbox "Enter new hostname:" 10 40) #3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    read $newhost 
    printf "$s\n" "User entered: $newhost"
else
    printf "$s\n" "Canceling..."
    exit 1
fi
