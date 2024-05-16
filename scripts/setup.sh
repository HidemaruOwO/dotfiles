#!/usr/bin/env bash
CURRENT=$(
	cd $(dirname $0)
	pwd
)

if [ "$(pwd)" != "$HOME/dotfiles" ]; then
	echo -e "\e[1;31m🙅 Please run this script in $HOME/dotfiles\e[0m"
	exit 1
fi

echo "┌──────────────────────────────────────┐"
echo -e "\e[1m│   ♻ Dotfiles Setup V1                │\e[0m"
echo "└──────────────────────────────────────┘"

function process() {
	OS_NAME=""
	IS_WSL=1
	IS_CLI_ONLY=1

	# Check if using WSL
	if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
		IS_WSL=0
		IS_CLI_ONLY=0
	fi
	if [ "$1" == "--cli-only" ]; then
		IS_CLI_ONLY=0
	fi

	echo -e "🔎 \e[1mChecking your OS...\e[0m"
	if [ "$(uname)" == "Darwin" ]; then
		OS_NAME="darwin"
	elif [ -e /etc/redhat-release ]; then
		OS_NAME="redhat"
	elif [ -e /etc/arch-release ]; then
		OS_NAME="arch"
	elif [ -e /etc/lsb-release ] || [ -e /etc/debian_version ]; then
		OS_NAME="ubuntu"
	elif [ -e /etc/suse-release ]; then
		OS_NAME="suse"
	else
		echo "Your OS is not supported"
		return 0
	fi

	echo "💡 Your OS: $OS_NAME"
	if [ "$IS_CLI_ONLY" == 0 ]; then
		echo "⌨ CLI Only: true"
	else
		echo "⌨ CLI Only: false"
	fi

	if [ "$OS_NAME" == "arch" || "$OS_NAME" == "redhat" ]; then
		echo -e "♻ \e[1mSyncing repositories and Updating softwares...\e[0m"
		if [ "$OS_NAME" == "arch" ]; then
			sudo pacman -Syyu --noconfirm
		fi
		if [ "$OS_NAME" == "redhat" ]; then
			sudo dnf update -y
			sudo dnf upgrade -y
		fi
		if [ "$IS_CLI_ONLY" == 0 ]; then
			# CLI only
			echo -e "⬇ \e[1mInstalling dependecies...\e[0m"
			cat $CURRENT/installDepsOnlyCli.sh | bash
			echo 'EDITOR=nvim' >>/etc/environment
		else
			# GUI
			echo -e "⬇ \e[1mInstalling dependecies...\e[0m"
			if [ "$OS_NAME" == "arch" ]; then
				cat $CURRENT/installDeps.sh | bash
			fi
			if [ "$OS_NAME" == "redhat" ]; then
				cat $CURRENT/installDepsForFedora.sh | bash
			fi

			cat <<EOF >>/tmp/environment.tmp
EDITOR=nvim
LC_CTYPE=ja_JP.UTF-8
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
DefaultIMModule=fcitx
EOF

			sudo mv /tmp/environment.tmp /etc/environment

			echo -e "🔥 \e[1mEnable firewall with ufw...\e[0m"
			sudo systemctl enable --now ufw
			sudo ufw enable
			sudo ufw allow 22
			sudo ufw allow 80
			sudo ufw allow 443
			sudo ufw allow 9090

			echo -e "🪟 \e[1mSetup sddm and theme...\e[0m"
			cat $CURRENT/installSDDMAstronaut.sh | sudo bash
			cat $CURRENT/installDraculaThemes.sh | sudo bash
			cat $CURRENT/changeSddmBackground.sh | sudo bash -s $HOME/dotfiles/templates/background/sddm/modern_slime.png

			echo -e "🤘 \e[1mSetup GRUB theme...\e[0m"
			git clone --depth 1 https://gitlab.com/VandalByte/darkmatter-grub-theme.git /tmp/darkmatter-grub-theme && cd /tmp/darkmatter-grub-theme
			sudo python3 darkmatter-theme.py --install

		fi # GUI
	fi

	echo -e "♻ \e[1mCreating symbolic from dotfiles's config...\e[0m"
	cat $CURRENT/dotfilesLink.sh | bash
	echo -e "⬇ \e[1mInstalling fish's plugin manager named 'oh my fish'...\e[0m"
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	echo -e "⬇ \e[1mInstalling fish's plugins...\e[0m"
	cat $CURRENT/installOmfPlugin.fish | fish
	echo -e "✏️ \e[1mConfigure Git settings\e[0m"
	cat $CURRENT/setupGit.sh | bash
	echo -e "🤘 \e[1mConfigure default shell with fish...\e[0m"
	cat $CURRENT/setDefaultShell.sh | bash -s fish
	echo -e "🤘 \e[1mAdd locale...\e[0m"
	sudo localedef -f UTF-8 -i ja_JP ja_JP
	sudo localedef -f UTF-8 -i en_US en_US
	cd $HOME
	figlet 'finished!!'
	echo -e "📓 \e[1mToDo: \e[0m"
	echo "    - Set your icon for sddm (Linux GUI user only)"
	echo "      (You can set it by running 'sudo $CURRENT/addSddmIcon.sh <path-to-png-image> <username>')"
	echo "    - Reboot (Linux GUI user only)"
}

while true; do
	echo -n -e "\e[1;35m🤝 Would you like to setup dotfiles?\e[0m [Y/n]: "
	read AND
	case $AND in
	[Yy]* | "")
		process $1
		exit 0
		;;
	[Nn]*)
		echo "👋 See you again!"
		exit 0
		;;
	*)
		echo -e "\e[1;31m🙅 Please answer YES or NO.\e[0m"
		;;
	esac
done
