#!/bin/bash

WINDOW_CLASS=$(hyprctl activewindow | grep "class:" | awk '{print $2}')

case $WINDOW_CLASS in
discord)
    echo "󰙯 Discord"
    ;;
WebCord)
    echo "󰙯 Webcord"
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
org.kde.dolphin)
    echo " Dolphin"
    ;;
thunar)
    echo " Thunar"
    ;;
google-chrome)
    echo " Google Chrome"
    ;;
vivaldi-stable)
    echo " Vivaldi"
    ;;

"") ;;
*)
    echo " $WINDOW_CLASS"
    ;;
esac