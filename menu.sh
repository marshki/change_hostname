scriptname=`basename "$0"`
currenthost=$(cat /etc/hostname)

whiptail --msgbox --backtitle "$scriptname" "The current hostname is $currenthost" 10 40
