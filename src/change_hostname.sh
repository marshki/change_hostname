#!/bin/bash
# mjk 2017.11.18

############################################
### Change hostname in Ubuntu,           ###
### and probably other Debian-based OSs. ###
### Command-line interface.              ###
############################################

# Assign 0 to root_uid
root_uid=0

#Assign existing hostname to $hostn
currenthost=$(cat /etc/hostname)

#Exit if not ROOT. 
if [ "$UID" -ne "$root_uid" ]; then 
    printf "%s\n" "ROOT privileges are required to continue. Exiting.">&2
    exit 1
fi 

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
