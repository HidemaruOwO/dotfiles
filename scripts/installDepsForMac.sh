#!/usr/bin/env bash

INSTLOG="install.log"
#-- パッケージ -----------------------------------------
taps=(
	hidemaruowo/tap        # 自作パッケージ
	ikanago/tap            # 自作パッケージ
	homebrew/cask-fonts    # フォント
	homebrew/cask-versions # バージョン
)
go_apps=(
	github.com/melbahja/got/cmd/got@latest # Go製のCLIダウンローダー
	github.com/nao1215/gup@latest          # Go製のCLIのアップデーター
	github.com/sheepla/pingu@latest        # Go製のCLIのping
	github.com/koki-develop/sheep@latest   # Go製のCLIのsleep
)
font_resources=(
	font-fontawesome              # アイコンフォント
	font-symbols-only-nerd-font   # アイコンフォント
	font-noto-sans-cjk            # フォント
	font-jetbrains-mono-nerd-font # フォント
	font-hack-nerd-font           # フォント
	font-roboto                   # フォント
	font-roboto-mono-nerd-font    # フォント
	font-fira-code-nerd-font      # フォント
	font-udev-gothic-nf           # 日本製フォント
	font-noto-sans-cjk-jp         # 日本語フォント
)
dev_environments=(
	wezterm            # ターミナル
	kitty              # ターミナル
	vivaldi            # ブラウザ
	google-chrome      # ブラウザ
	firefox            # ブラウザ
	floorp             # ブラウザ
	jetbrains-toolbox  # IDEマネージャー
	visual-studio-code # エディター
	neovide            # エディター
	visual-studio      # IDE
	github             # GitHubクライアント
	discord            # チャット
	slack              # チャット
	zoom               # チャット
	termius            # SSHクライアント
	deluge             # torrentクライアント
)
module_utils=(
	karabiner-elements # キーバインドユーティリティ
	skhd               # キーバインドユーティリティ
	yabai              # タイリングウィンドウマネージャ
	gyazo              # スクリーンレコーダー
	clipy              # クリップボードの履歴
	obs                # スクリーンレコーダー
	obs-virtualcam     # OBSのカメラ出力
	wget               # ダウンローダー
	p7zip              # 圧縮・解凍
	sqlite             # DB
)
unixporn=(
	bat                 # 高機能版cat
	gat                 # 高機能版cat
	lsd                 # 高機能版ls
	exa                 # 高機能版ls
	gh                  # GitHub CLI
	neovim              # エディタ
	thefuck             # コマンド修正
	omekasy             # 𝓜𝔂 𝓷𝓮𝔀 𝓰𝓮𝓪𝓻
	lazygit             # gitフロントエンド
	ripgrep             # 高機能版grep
	the_silver_searcher # 高機能版grep
	btop                # パフォーマンスモニター
	htop                # パフォーマンスモニター
	bottom              # パフォーマンスモニター
	zenith              # パフォーマンスモニター
	figlet              # メッセージレンダラー
	toilet              # メッセージレンダラー
)
shells=(
	fish # シェル
	bash # シェル
	zsh  # シェル
)
languages=(
	deno
	node
	go
	openjdk@8
	openjdk@17
	rust
	zig
	lua
	luajit
	php
	ruby
	julia
)
language_tools=(
	composer
	rust-analyzer
	zls
	gopls
	pipx
	npm
	yarn
	pnpm
	eslint
	prettier
	prettierd
	isort
	black
	stylua
	shfmt
	codespell
)
# caskとformulaで名前が被ってるときに
other_casks=(
	termius # SSHクライアント
)
# 新しい `packages` 配列の作成
packages=(
	"${dev_environments[@]}"
	"${module_utils[@]}"
	"${unixporn[@]}"
	"${font_resources[@]}"
	"${shells[@]}"
	"${languages[@]}"
	"${language_tools[@]}"
)
#-- 関数 -----------------------------------------
install_software() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	brew install $1 >>$INSTLOG
}
install_cask() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	brew install --cask $1 >>$INSTLOG
}
install_go_app() {
	echo -en "\e[90m⭐ Installing\e[0m \e[97m$1\e[0m..."
	go install $1 >>$INSTLOG
}
let_s_tap() {
	echo -e "\e[90m🍺 Tapping\e[0m \e[97m$1\e[0m..."
	brew tap $1 >>$INSTLOG
}
installed() {
	echo -en "✅ Installed package \e[97m$1\e[0m."
}
#-- 表示 -----------------------------------------
clear
echo "┌──────────────────────────────────────┐"
echo -e "\e[1m│  💾 Install Deps For Mac V1          │\e[0m"
echo "└──────────────────────────────────────┘"
while true; do
	echo -n -e "\e[1;35m🤝 Would you like to install dependencies?\e[0m [Y/n]: "
	read AND
	case $AND in
	[Yy]* | "")
		echo -e "Installing dependencies..."
		sleep 2
		echo "Please enter password required"
		sudo -v

		if !(type "brew" > /dev/null 2>&1); then
			echo -en "Installing homebrew."
			bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi

		sleep 2
		echo "✅ Installed brew"
		#-- インストールステップ -----------------------------------------
		package_count=$((${#packages[@]} + ${#other_casks[@]} + ${#go_apps[@]}))
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

		for TAP in ${taps[@]}; do
			let_s_tap $TAP
		done
		sleep 3
		display_installation
		for SOFT in ${packages[@]}; do
			((current_package++))
			display_installation
			install_software $SOFT &>/dev/null
		done
		for CASK in ${other_casks[@]}; do
			((current_package++))
			display_installation
			install_cask $CASK &>/dev/null
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

		installed_packages=(
			"${go_apps[@]}"
			"${packages[@]}"
			"${other_casks[@]}"
		)

		for SOFT in ${installed_packages[@]}; do
			echo -e "  -> Installed $SOFT"
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
