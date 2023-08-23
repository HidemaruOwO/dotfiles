#!/bin/bash

WINDOW_CLASS=$(hyprctl activewindow | grep "class:" | awk '{print $2}')

case $WINDOW_CLASS in
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
thunar)
    echo " Thunar"
    ;;
google-chrome)
    echo " Google Chrome"
    ;;
"") ;;
*)
    echo " $WINDOW_CLASS"
    ;;
esac
