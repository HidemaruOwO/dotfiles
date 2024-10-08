#!/bin/bash

WINDOW_CLASS=$(hyprctl activewindow | grep "class:" | awk '{print $2}')

case $WINDOW_CLASS in
discord)
	echo "󰙯 Discord"
	;;
WebCord)
	echo "󰙯 Webcord"
	;;
org.mozilla.firefox)
	echo " Firefox"
	;;
firefox)
	echo " Firefox"
	;;
Code)
	echo " Visual Studio Code"
	;;
org.wezfurlong.wezterm)
	echo " WezTerm"
	;;
alacritty)
	echo " Alacritty"
	;;
kitty)
	echo " Kitty"
	;;
org.kde.dolphin)
	echo " Dolphin"
	;;
thunar)
	echo " Thunar"
	;;
google-chrome)
	echo " Google Chrome"
	;;
Vivaldi-stable)
	echo " Vivaldi"
	;;
slack)
	echo "󰒱 Slack"
	;;
"")
	echo "󰇄 Desktop"
	;;
*)
	echo " $WINDOW_CLASS"
	;;
esac
