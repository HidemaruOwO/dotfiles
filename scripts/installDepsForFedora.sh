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

pip_apps=(
	hyfetch # 同じく
)

core_apps=(
	hyprland       # WM
	chromium       # ブラウザ
	firefox        # 人気のウェブブラウザ
	Thunar         # 軽量ファイルマネージャ
	wezterm        # ターミナルエミュレータ
	wpa_supplicant # WiFi
)
dm_packages=(
	sddm # モダンなディスプレイマネージャ
	# dependencies
	qt6-qt5compat
	qt6-declarative
	qt6-qtsvg
)
input_tools=(
	fcitx5 # 入力メソッドフレームワーク
	# dependencies
	fcitx5-configtool
	fcitx5-gtk
	fcitx5-qt5
	fcitx5-mozc # Mozcに基づく日本語入力メソッド
)
font_resources=(
	fontawesome-fonts-all
	gdouros-symbola-fonts
	twitter-twemoji-fonts
	google-noto-sans-cjk-fonts
	google-roboto-fonts
	jetbrains-mono-fonts
	fira-code-fonts
)
dev_environments=(
	code
	golang-github-cli2-devel
	neovim # 高機能なテキストエディタ
	kitty
	zsh
	fish
	lazygit
	ripgrep
	the_silver_searcher
	thefuck
	pipx
)
module_utils=(
	obs-studio
	ufw
	gufw
	xdg-user-dirs
	xdg-user-dirs-gtk
	spdlog-git
	polkit-gnome  # GNOMEのためのPolkit認証ダイアログ
	wl-clipboard  # Waylandのクリップボードユーティリティ
	pavucontrol   # PulseAudioボリュームコントロール
	brightnessctl # 明るさの調整ユーティリティ
	bluez         # LinuxのBluetoothスタック
	blueman       # Bluetoothマネージャ
	NetworkManager
	network-manager-applet # ネットワークマネージャのアプレット
	thunar-archive-plugin  # Thunarのアーカイブプラグイン
	pipewire
	wireplumber
	chafa
	autokey-gtk
	autokey-common
	imwheel
	xsel
	wget
	zip
	unzip
	p7zip
	gthumb
	deluge
	deluge-gtk
	sqlite
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
	waybar                      # Wayland用のステータスバー
	swaybg                      # 壁紙
	swaylock                    # swayのロックスクリーン
)
unixporn=(
	neofetch     # システム情報を表示するユーティリティ
	starship     # カスタマイズ可能なシェルプロンプト
	btop         # リソースモニタ
	lxappearance # GTKテーマのカスタマイズツール
	bat          #catの高機能版
	eza          #lsの高機能版
	lsd          # 絵文字がつく
	figlet
	toilet
)

language=(
	python3
	nodejs
	go
	java-17-openjdk
	rust
	zig
	lua
	ruby
	gawk
)
language_tools=(
	# lsp
	golang-x-tools-gopls
	rust-analyzer
	# package manager
	pip
	npm
	pnpm
	luarocks
	# formatter
	python3-isort
	python3-lsp-black
	shfmt
	# linter
	codespell
)
taps=(
	"oven-sh/bun"
)
brew_apps=(
	deno
	bun
	zls
	stylua
	eslint
	prettier
	prettierd
)
# 新しい `packages` 配列の作成
packages=(
	"${dm_packages[@]}"
	"${input_tools[@]}"
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
	sudo dnf install -y $1 >>$INSTLOG
	show_progress $!
}
install_go_app() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	go install $1 >>$INSTLOG
}
install_pip_app() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	pipx install $1 >>$INSTLOG
}
install_brew_app() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	brew install $1 >>$INSTLOG
}

let_s_tap() {
	echo -e "\e[90m🍺 Tapping\e[0m \e[97m$1\e[0m..."
	TAPPING="$TAPPING
  $(echo -e "\e[90m🍺 Taped\e[0m \e[97m$1\e[0m...")"
	brew tap $1 >>$INSTLOG
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

		#-- インストールステップ -----------------------------------------
		package_count=$((${#packages[@]} + ${#go_apps[@]} + ${#pip_apps[@]} + ${#brew_apps[@]}))
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
		echo "Adding other repositories"
		sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
		echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
		sudo dnf install -y dnf-plugins-core
		sudo dnf copr -y enable atim/lazygit
		sudo dnf update -y
		curl -fsSL https://deno.land/install.sh | sh >>$INSTLOG
		curl -fsSL https://bun.sh/install | bash >>$INSTLOG
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash >>$INSTLOG
		export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
		# Initialize the display
		for TAP in ${taps[@]}; do
			let_s_tap $TAP
		done

		display_installation
		for SOFTWR in ${packages[@]}; do
			install_software $SOFTWR >/dev/null
			((current_package++))
			display_installation
		done
		for GO_APP in ${go_apps[@]}; do
			((current_package++))
			display_installation
			install_go_app $GO_APP &>/dev/null
		done
		for PIP_APP in ${pip_apps[@]}; do
			((current_package++))
			display_installation
			install_pip_app $PIP_APP &>/dev/null
		done
		for BREW_APP in ${brew_apps[@]}; do
			((current_package++))
			display_installation
			install_brew_app $BREW_APP >/dev/null
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
