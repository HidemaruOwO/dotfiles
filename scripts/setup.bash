#!/bin/bash
CURRENT=$(cd $(dirname $0);pwd)

echo "┌──────────────────────────────────────┐"
echo -e "\e[1m│   ♻ Dotfiles Setup V1                │\e[0m"
echo "└──────────────────────────────────────┘"

function process () {
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
  echo -e "🤘 \e[1mリポジトリの同期とソフトウェアの更新中...\e[0m"
  sudo pacman -Syyu --noconfirm
  echo -e "🤘 \e[1m周辺パッケージをインストール中...\e[0m"
  bash $CURRENT/install-deps.bash
  echo -e "🤘 \e[1mxprofileにfcitxの設定を書き込み中...\e[0m"
  cat /etc/environment > /tmp/environment.tmp
  echo 'EDITOR=nvim
LC_CTYPE=ja_JP.UTF-8
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
DefaultIMModule=fcitx' >> /tmp/environment.tmp
  sudo mv /tmp/environment.tmp /etc/environment
  echo -e "🤘 \e[1mSSDのTrimコマンドを有効中...\e[0m"
  sudo systemctl enable fstrim.timer
fi

echo -e "🤘 \e[1mDotfilesとローカルをリンク中...\e[0m"
bash $CURRENT/dotfilesLink.bash
echo -e "💎 \e[1mホームディレクトリのカレントディレクトリの英語化\e[0m"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fish $CURRENT/install-omf-plugin.fish
LANG=C xdg-user-dirs-gtk-update
echo -e "💎 \e[1mファイアーウォールの有効化\e[0m"
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw enable
echo -e "✏️ \e[1m\]git configにユーザー情報を登録\e[0m"
read -p ":: Type your Git username: " GIT_USERNAME
read -p ":: Type your Git email: " GIT_EMAIL
echo -e "🤘 \e[1mgit configにuser.nameを登録中...\e[0m"
git config --global user.name $GIT_USERNAME
echo -e "🤘 \e[1mgit configにuser.emailを登録中...\e[0m"
git config --global user.email $GIT_EMAIL
echo -e "🤘 \e[1mgit configにcore.editorにNeovimを登録中...\e[0m"
git config --global core.editor nvim
echo -e "🤘 \e[1msddmのセットアップ中...\e[0m"
git clone https://github.com/aczw/sddm-theme-corners.git /tmp/sddm-theme-corners
cd /tmp/sddm-theme-corners
sudo cp -r corners/ /usr/share/sddm/themes/
echo "[Theme]
Current=corners" > /tmp/theme.conf
sudo mkdir -p /etc/sddm.conf.d
sudo mv /tmp/theme.conf /etc/sddm.conf.d/theme.conf
sudo systemctl enable sddm
echo -e "🤘 \e[1mGRUBテーマのセットアップ中...\e[0m"
git clone --depth 1 https://gitlab.com/VandalByte/darkmatter-grub-theme.git /tmp/darkmatter-grub-theme && cd /tmp/darkmatter-grub-theme
sudo python3 darkmatter-theme.py --install
echo -e "🤘 \e[1mSet fish to default shell...\e[0m"
sudo chsh $USER -s $(which fish)
sudo chsh -s $(which fish)
echo -e "🤘 \e[1mAdd locale...\e[0m"
sudo localedef -f UTF-8 -i ja_JP ja_JP
sudo localedef -f UTF-8 -i en_US en_US
cd $HOME
figlet 'Finished!!'
}

while true; do
    echo -n -e "\e[1;35m🤝 Would you like to setup dotfiles?\e[0m [Y/n]: "
    read ANS
    case $ANS in
      [Yy]*|"")
      process
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

