#!/bin/bash

profiles_dir="$HOME/.config/waybar/profiles"
waybar_dir="$HOME/.config/waybar"

profiles_list=($(find "$profiles_dir" -maxdepth 1 -type d -exec basename {} \;))

echo "┌──────────────────────────────────────┐"
echo -e "\e[1m│   🎨 Waybar Profiler V1              │\e[0m"
echo "└──────────────────────────────────────┘"

echo -e "\e[1m:) Available profiles:\e[0m"
for i in "${!profiles_list[@]}"; do
	if [ "$i" -eq 0 ]; then
		continue
	fi
	echo ":: $i: ${profiles_list[i]}"
done

read -p "Select profile number: " profile_number

if ! [[ "$profile_number" =~ ^[0-9]+$ ]]; then
	echo "Need to enter a number."
	exit 1
fi

selected_profile="${profiles_list[$profile_number]}"

if [ -d "$profiles_dir/$selected_profile" ]; then
	config_jsonc="$profiles_dir/$selected_profile/config.jsonc"
	style_css="$profiles_dir/$selected_profile/style.css"
	if [ -f "$config_jsonc" ] && [ -f "$style_css" ]; then
		ln -sf "$config_jsonc" "$waybar_dir/config.jsonc"
		ln -sf "$style_css" "$waybar_dir/style.css"

		echo "Waybar profile changed to $selected_profile."
		exit 0
	else
		echo -e "\e[1m\e[31m⚠️ \e[0m\e[31mDo not found profile file\e[0m"
	fi
else
	echo -e "\e[1m\e[31m⚠️ \e[0m\e[31mDo not found profile directory\e[0m"
fi
