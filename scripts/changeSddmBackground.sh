#!/usr/bin/env bash
# Check args
if [ $# -eq 0 ]; then
	echo "No arguments supplied"
	exit 1
fi
# Check path
if [[ "$1" == /* ]]; then
	echo "Check path OK."
else
	echo "Please use full path."
	exit 1
fi
# Check exist file
if [ -f "$1" ]; then
	sudo -v
	IMAGE_PATH=$(basename $1)
	echo "🌟 Background image path: $1"
	sudo cp $1 /usr/share/sddm/themes/corners/backgrounds/$IMAGE_PATH
	sudo sed -i "s/Background=\"[^\"]*\"/Background=\"backgrounds\/$IMAGE_PATH\"/" /usr/share/sddm/themes/corners/theme.conf
	echo "✅ Background image changed"
	exit 0
else
	echo "File does not exist"
	exit 1
fi
