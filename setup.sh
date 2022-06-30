#!/bin/bash
echo "\[\e[0m\] \[\e[1m\]💨 セットアップスクリプトを実行中\[\e[0m\]"

echo "🔎 \[\e[1m\]あなたのOSを判別中...\[\e[0m\]"
OsName=""
if [ "$(uname)" == "Darwin" ]; then
  # Mac OSX
  OsName="mac"
  elif [ -e /etc/redhat-release ]; then
  # Red Hat
  OsName="redhat"
elif [ -e /etc/arch-release ]; then
   # Arch
  OsName="arch"
elif [ -e /etc/lsb-release ] || [ -e /etc/debian_version ]; then
  # Ubuntu, Debian
  OsName="ubuntu"
elif [ -e /etc/suse-release ]; then
  # SUSE
  OsName="suse"
else
  echo "Your OS is not supported."
  return 0;
fi
echo "💡あなたのOSは$OsNameです"
#OS別環境構築
if [ "$OsName" == "arch" ]; then
  echo "🤘 \[\e[1m\]リポジトリのミラーサーバーの変更中...\[\e[0m\]"
  sudo pacman-mirrors --fasttrack
  echo "🤘 \[\e[1m\]リポジトリの同期とソフトウェアの更新中...\[\e[0m\]"
  sudo pacman -Syyu --noconfirm
  echo "🤘 \[\e[1m\]周辺パッケージをインストール中...\[\e[0m\]"
  sudo pacman -Syu --noconfirm figlet xdg-user-dirs-gtk gufw cmake yay neovim zsh git wezterm opera gnome-keyring fish fcitx-im fcitx-mozc blender gimp obs-studio vim
  echo "🤘 \[\e[1m\]プログラミング言語をインストール中...\[\e[0m\]"
  sudo pacman -Syu --noconfirm nodejs npm yarn go rust nim deno lua dotnet-sdk julia jdk-openjdk kotlin
  echo "🤘 \[\e[1m\].xprofileにfcitxの設定を書き込み中...\[\e[0m\]"
  echo 'export LANG="ja_JP.UTF-8"
export XMODIFIERS="@im=fcitx"
export XMODIFIER="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export DefaultIMModule=fcitx' >> $HOME/.xprofile
  echo "🤘 \[\e[1m\]SSDのTrimコマンドを有効中...\[\e[0m\]"
  sudo systemctl enable fstrim.timer
  echo "🤘 \[\e[1m\]Manjaroのエラーをチェック中...\[\e[0m\]"
  sudo systemctl --failed
  sudo journalctl -p 3 -xb
 fi

echo "🤘 \[\e[1m\]Dotfilesとローカルをリンク中...\[\e[0m\]"
bash $HOME/dotfiles/dotfilesLink.sh
echo "🤘 \[\e[1m\]OhMyZshプラグイン、zsh-syntax-highlightingをインストールします\[\e[0m\]"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "🤘 \[\e[1m\]OhMyZshテーマ、powerlevel10kをインストール中...\[\e[0m\]"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "🤘 \[\e[1m\]git configにuser.nameを登録中...\[\e[0m\]"
git config --global user.name HidemaruOwO
echo "🤘 \[\e[1m\]git configにcore.editorにNeovimを登録中...\[\e[0m\]"
git config --global core.editor nvim
# 残っているタスクの表示
if ["$OsName" == "arch"]; then
  echo "\[\e[36mタスクリスト\e[0m\]"
  echo ""
  echo "💎 ホームディレクトリのカレントディレクトリの英語化"
  echo "\[\e[32m\]==>\[\e[0m\] \[\e[1m\]LANG=C xdg-user-dirs-gtk-update\[\e[0m\]"
  echo "⚠️ Don't ask me againにチェックを入れてください"
  echo ""
  echo "💎 キャッシュをRAMディスクに保存"
  echo "\[\e[32m\]==>\[\e[0m\] \[\e[1m\]sudo nvim /etc/fstab\[\e[0m\]"
  echo "💡fatabにこちらを追加してください"
  echo "\[\e[32m\]==>\[\e[0m\] \[\e[1m\]tmpfs /home/$USER/.cache tmpfs noatime,nodev,nosuid,size=2G 0 0\[\e[0m\]"
  echo "⚙️ こちらを終了しましたらこのコマンドを実行してください"
  echo "\[\e[32m\]==>\[\e[0m\] \[\e[1m\]sudo mount -a\[\e[0m\]"
  echo ""
  echo "💎 ファイアウォールの有効化"
  echo "\[\e[32m\]==>\[\e[0m\] \[\e[1m\]gufw\[\e[0m\]"
  echo "💡 Status: ON,Incoming: Deny,Outgoing: Allowに設定してください"
fi

echo ""
echo "💎 git configにuser.emailを登録"
echo "\[\e[32m\]==>\[\e[0m\] \[\e[1m\]git config --global user.email YourEmail@example.com\[\e[0m\]"
echo "💡 YourEmail@example.com をあなたのメールアドレスに変更してください"

figlet 'Finished!!'
