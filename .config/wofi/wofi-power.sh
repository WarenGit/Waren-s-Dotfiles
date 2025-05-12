#!/bin/bash

entries="⇠ Logout\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 300 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
	logout)
		exec loginctl terminate-user  $USER;;
	reboot)
		exec systemctl reboot;;
	shutdown)
		exec systemctl poweroff -i;;
esac
