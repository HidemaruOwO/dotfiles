#!/bin/bash
# Check args
if [ $# -ne 2 ]; then
	echo "Need 2 args."
	echo "Usage: add-sddm-icon.bash <path-to-image> <username>"
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
	IMAGE_PATH=$(basename $1)
	# Check file is ping image
	extension="${IMAGE_PATH##*.}"
	extension="${extension,,}"

	if [ "$extension" = "png" ]; then
		sudo -v
		sudo cp $1 /usr/share/sddm/faces/$2.face.icon
		echo "✅ Set icon for user: $2"
	else
		echo "File is not png image."
	fi
else
	echo "File does not exist."
	exit 1
fi
