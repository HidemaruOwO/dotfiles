#!/usr/bin/env bash
#
# Reference: doremire/ArchLinux-Dotfiles
#
INSTLOG="install.log"
#-- パッケージ -----------------------------------------
go_apps=(
	github.com/melbahja/got/cmd/got@latest # Go製のCLIダウンローダー
	github.com/nao1215/gup@latest          # Go製のCLIのアップデーター
	github.com/sheepla/pingu@latest        # Go製のCLIのping
	github.com/koki-develop/sheep@latest   # Go製のCLIのsleep
	github.com/hidemaruowo/pummit@latest   # Go製のCLIのgit commit
)

dev_environments=(
	github-cli             # GitHubのCLIツール
	neovim                 # 高機能なテキストエディタ
)
module_utils=(
	spdlog-git
	pacman-contrib         # pacmanの追加ユーティリティ
	paru
	wireplumber
	zsh
	webapp-manager
	fish
	thefuck
	less
	lazygit
	ripgrep
	the_silver_searcher
	fd
	wget
	zip
	unzip
	p7zip
	sqlite
)
unixporn=(
	neofetch     # システム情報を表示するユーティリティ
	hyfetch      # 同じく
	starship     # カスタマイズ可能なシェルプロンプト
	btop         # リソースモニタ
	bottom       # 同じく
	bat          #catの高機能版
	exa          #lsの高機能版
	lsd          # 絵文字がつく
	figlet
	toilet
	python-neovim
)
language=(
	deno
	python
	nodejs
	go
	jdk-openjdk
	rust
	bunjs-bin
	zig
	lua
	php
	composer
	ruby
	julia
	gawk
)
language_tools=(
	# lsp
	zls
	gopls
	rust-analyzer
	# package manager
	python-pip
	python-pipx
	npm
	yarn
	pnpm
	zigmod-bin
	gyro-bin
	luarocks
	# formatter
	eslint
	eslint_d
	prettier
	prettierd
	python-isort
	python-black
	stylua
	shfmt
	# linter
	codespell
)
# 新しい `packages` 配列の作成
packages=(
	"${dev_environments[@]}"
	"${module_utils[@]}"
	"${unixporn[@]}"
	"${language[@]}"
	"${language_tools[@]}"
)
#-- 関数 -----------------------------------------
install_software() {
	echo -en "\e[90mInstalling\e[0m \e[97m$1\e[0m..."
	yay -S --needed --noconfirm $1 &>>$INSTLOG &
	show_progress $!
}
install_go_app() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	go install $1 >>$INSTLOG
}

installed() {
	echo -en "✅ Installed package \e[97m$1\e[0m."
}
#-- 表示 -----------------------------------------
clear
echo "┌──────────────────────────────────────┐"
echo -e "\e[1m│  💾 Install Deps V1                  │\e[0m"
echo "└──────────────────────────────────────┘"
while true; do
	echo -n -e "\e[1;35m🤝 Would you like to install dependencies?\e[0m [Y/n]: "
	read AND
	case $AND in
	[Yy]* | "")
		# #-- AURのインストール -----------------------------------------
		echo "🔒 Please enter password required"
		sudo -v

		if !(type "yay" > /dev/null 2>&1); then
			echo -en "Configuering yay."
			git clone https://aur.archlinux.org/yay.git &>>$INSTLOG
			cd yay
			makepkg -si --noconfirm &>>../$INSTLOG
			cd ..
			rm -rf yay
		fi

		sleep 2
		echo "✅ Installed yay"
		#-- インストールステップ -----------------------------------------
		package_count=$((${#packages[@]} + ${#go_apps[@]}))
		current_package=0
		DISPLAY_LINES=10
		CURSOR_MOVE=$((DISPLAY_LINES + 1))
		# Display the header
		display_header() {
			echo "┌──────────────────────────────────────┐"
			echo -e "\e[1m│  💾 Install Deps V1                  │\e[0m"
			echo "└──────────────────────────────────────┘"

			echo -e "\e[K:: Installing package ($current_package/$package_count)"
		}
		# Print the last DISPLAY_LINES actions
		display_actions() {
			local start_index=$((current_package - DISPLAY_LINES))
			if [ $start_index -lt 0 ]; then
				start_index=0
			fi
			for ((i = 0; i < DISPLAY_LINES; i++)); do
				echo -en "\e[K"
				if [ $((start_index + i)) -lt $current_package ]; then
					echo "  Installing ${packages[start_index + i]}.."
				else
					echo ""
				fi
			done
		}
		# Manage the entire display
		display_installation() {
			clear
			echo -en "\e[${CURSOR_MOVE}A"
			display_header
			display_actions
		}
		show_progress() {
			while ps | grep $1 &>/dev/null; do
				sleep 1
			done
		}
		# Initialize the display
		display_installation
		for SOFTWR in ${packages[@]}; do
			install_software $SOFTWR &>/dev/null
			((current_package++))
			display_installation
		done
		for GO_APP in ${go_apps[@]}; do
			((current_package++))
			display_installation
			install_go_app $GO_APP &>/dev/null
		done

		sleep 1
		echo -e "✅ Installation step completed ..."
		sleep 5
		# Display installation completion for each package with a random delay
		echo -e "\n==> Installation Summary: [packages]"
		for SOFTWR in ${packages[@]}; do
			echo -e "  -> Installed $SOFTWR"
			# Generate a random delay between 0 and 0.3 seconds
			random_delay=$(awk -v min=0 -v max=0.3 'BEGIN{srand(); print min+rand()*(max-min)}')
			sleep $random_delay
		done

		exit 0
		;;
	[Nn]*)
		echo -e "Step: install-deps cancelled."
		exit 0
		;;
	*)
		echo -e "\e[1;31m🙅 Please answer YES or NO.\e[0m"
		;;
	esac
done
