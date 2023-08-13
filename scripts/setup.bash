#!/bin/bash
echo -e "💨 \e[0m\e[1mセットアップスクリプトを実行中\e[0m"

echo -e "🔎 \e[1mあなたのOSを判別中...\e[0m"
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
echo "💡 あなたのOSは$OsNameです"
#OS別環境構築
if [ "$OsName" == "arch" ]; then
  echo -e "🤘 \e[1mリポジトリのミラーサーバーの変更中...\e[0m"
  sudo pacman-mirrors --fasttrack
  echo -e "🤘 \e[1mリポジトリの同期とソフトウェアの更新中...\e[0m"
  sudo pacman -Syyu --noconfirm
  echo -e "🤘 \e[1m周辺パッケージをインストール中...\e[0m"
  sudo pacman -Syu --noconfirm deno nodejs npm yarn fish neovim figlet hyfetch the_silver_searcher neofetch 
  echo -e "🤘 \e[1mxprofileにfcitxの設定を書き込み中...\e[0m"
  echo 'export LANG="ja_JP.UTF-8"
export XMODIFIERS="@im=fcitx"
export XMODIFIER="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export DefaultIMModule=fcitx' >> $HOME/.xprofile
  echo -e "🤘 \e[1mSSDのTrimコマンドを有効中...\e[0m"
  sudo systemctl enable fstrim.timer
  echo -e "🤘 \e[1mArchLinuxのエラーをチェック中...\e[0m"
  sudo systemctl --failed
  sudo journalctl -p 3 -xb
 fi

echo -e "🤘 \e[1mDotfilesとローカルをリンク中...\e[0m"
bash $HOME/dotfiles/scripts/dotfilesLink.bash
echo -e "🤘 \e[1m\]git configにuser.nameを登録中...\e[0m"
git config --global user.name HidemaruOwO
echo -e "🤘 \e[1mgit configにcore.editorにNeovimを登録中...\e[0m"
git config --global core.editor nvim
# 残っているタスクの表示
if ["$OsName" == "arch"]; then
  echo -e "\e[36mタスクリスト\e[0m"
  echo ""
  echo "💎 ホームディレクトリのカレントディレクトリの英語化"
  echo -e "\e[32m==>\e[0m \e[1mLANG=C xdg-user-dirs-gtk-update\e[0m"
  echo "⚠️ Don't ask me againにチェックを入れてください"
  echo ""
  echo "💎 ファイアウォールの有効化"
  echo -e "\e[32m==>\e[0m \e[1mgufw\e[0m"
  echo "💡 Status: ON,Incoming: Deny,Outgoing: Allowに設定してください"
fi

echo ""
echo "💎 git configにuser.emailを登録"
echo -e "\e[32m==>\e[0m \e[1mgit config --global user.email YourEmail@example.com\e[0m"
echo "💡 YourEmail@example.com をあなたのメールアドレスに変更してください"

figlet 'Finished!!'
