#!/bin/bash
#Changes hostname in Ubuntu. 
#Must be run as root. 

#Assign existing hostname to $hostn
currenthost=$(cat /etc/hostname)

#Display existing hostname
printf "%s\n" "Existing hostname is $currenthost"

#Ask for new hostname $newhost
printf "%s\n" "Enter new hostname: "
read newhost

#Change hostname in /etc/hosts & /etc/hostname
sed -i "s/$currenthost/$newhost/g" /etc/hosts
sed -i "s/$currenthost/$newhost/g" /etc/hostname

#Display new hostname
printf "%s\n" "Your new hostname is $newhost"

#Press a key to reboot
read -s -n 1 -p "Press any key to reboot"
reboot
