#!/bin/bash
#
# Reference: doremire/ArchLinux-Dotfiles
#
INSTLOG="install.log"
#-- パッケージ -----------------------------------------
dm_packages=(
	sddm # モダンなディスプレイマネージャ
	sddm-theme-corners-git
	# │
	# ├─ sddm
	# ├─ qt5-graphicaleffects
	# ├─ qt5-svg
	# ├─ qt5-quickcontrols2
	# └─ git              # バージョン管理システム
)
input_tools=(
	fcitx5-im # 入力メソッドフレームワーク
	# │
	# ├─ fcitx5
	# ├─ fcitx5-configtool
	# ├─ fcitx5-gtk
	# └─ fcitx5-qt
	fcitx5-mozc # Mozcに基づく日本語入力メソッド
)
themes=(
	dracula-icons-git
	dracula-gtk-theme
)
font_resources=(
	otf-font-awesome # アイコンフォント
	ttf-symbola      # Unicodeの記号と文字のフォント
	ttf-twemoji      # TwitterのEmoji用フォント
	noto-fonts-cjk   # GoogleのNoto CJKフォント
	ttf-nerd-fonts-symbols
	ttf-jetbrains-mono-nerd
	ttf-hack-nerd
	ttf-udev-gothic
	ttf-roboto
	ttf-firacode-nerd # モノスペースのコーディング用フォント
)
dev_environments=(
	visual-studio-code-bin # 人気のあるコードエディタ
	github-cli             # GitHubのCLIツール
	neovim                 # 高機能なテキストエディタ
	gedit
	discord
	webcord
	kitty
	zoom
	slack-desktop
	google-chrome
)
module_utils=(
	obs-studio
	ufw
	gufw
	xdg-user-dirs
	xdg-user-dirs-gtk
	spdlog-git
	polkit-gnome           # GNOMEのためのPolkit認証ダイアログ
	wl-clipboard           # Waylandのクリップボードユーティリティ
	cliphist               # 不明
	pacman-contrib         # pacmanの追加ユーティリティ
	pavucontrol            # PulseAudioボリュームコントロール
	brightnessctl          # 明るさの調整ユーティリティ
	bluez                  # LinuxのBluetoothスタック
	bluez-utils            # Bluetoothユーティリティ
	blueman                # Bluetoothマネージャ
	network-manager-applet # ネットワークマネージャのアプレット
	thunar-archive-plugin  # Thunarのアーカイブプラグイン
	pipewire
	paru
	wireplumber
	chafa
	zsh
	webapp-manager
	fish
	thefuck
	neovim-nvim-treesitter
	less
	autokey-gtk
	imwheel
	lazygit
	ripgrep
	the_silver_searcher
	fd
	xsel
	wget
	got-bin
	zip
	unzip
	p7zip
	gthumb
	deluge
	gnome-system-monitor
	sqlite
)
core_apps=(
	hyprland        # WM
	vivaldi         # ブラウザ
	firefox-i18n-ja # 人気のウェブブラウザ
	thunar          # 軽量ファイルマネージャ
	wezterm         # ターミナルエミュレータ
)
wayland_apps=(
	wl-clipboard # Waylandのクリップボードユーティリティ
	grim         # Waylandのスクリーンショットユーティリティ
	grimshot
	slurp                       # Waylandの領域選択ユーティリティ
	wofi                        # Waylandのランチャー
	wlogout                     # Waylandのログアウトユーティリティ
	xdg-desktop-portal-hyprland # 画面キャプチャするためのdesktop-portal
	mako                        # Wayland通知デーモン
	waybar-hyprland-cava-git    # Wayland用のステータスバー
	swaybg                      # 壁紙
	swww
	swaylock-effects # swayのロックスクリーン
)
unixporn=(
	neofetch     # システム情報を表示するユーティリティ
	hyfetch      # 同じく
	starship     # カスタマイズ可能なシェルプロンプト
	btop         # リソースモニタ
	bottom       # 同じく
	lxappearance # GTKテーマのカスタマイズツール
	nwg-look-bin # 同じ
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
	"${dm_packages[@]}"
	"${input_tools[@]}"
	"${themes[@]}"
	"${font_resources[@]}"
	"${dev_environments[@]}"
	"${module_utils[@]}"
	"${core_apps[@]}"
	"${wayland_apps[@]}"
	"${unixporn[@]}"
	"${language[@]}"
	"${language_tools[@]}"
)
#-- 関数 -----------------------------------------
install_software() {
	echo -en "\e[90mInstalling\e[0m \e[97m$1\e[0m..."
	yay -S --noconfirm $1 &>>$INSTLOG &
	show_progress $!
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
		echo -e "Installing dependencies..."
		sleep 2
		# #-- AURのインストール -----------------------------------------
		echo "Please enter password required"
		sudo -v

		if [ ! -f /sbin/yay ]; then
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
		package_count=${#packages[@]}
		current_package=0
		DISPLAY_LINES=10
		CURSOR_MOVE=$((DISPLAY_LINES + 1))
		# Display the header
		display_header() {
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

		echo "Install pumimt"
		go install github.com/HidemaruOwO/pummit/pummit@v1.1.3 &>>$INSTLOG
		echo "Install neovim deps"
		sudo npm install -g neovim &>>$INSTLOG
		echo "Install github extensions"
		gh extension install dlvhdr/gh-dash &>>$INSTLOG

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
