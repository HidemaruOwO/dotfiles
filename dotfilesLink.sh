#!/bin/zsh
if [ ! -e ~/.oh-my-zsh ]; then
  mkdir ~/.oh-my-zsh
fi
if [ ! -e ~/.config ]; then
  mkdir ~/.config
fi
if [ ! -e ~/.local ]; then
  mkdir ~/.local
fi
if [ ! -e ~/.local/share ]; then
  mkdir ~/.local/share
fi

ln -sf ~/dotfiles/config/omf ~/.local/share
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/config/nvim ~/.config
ln -sf ~/dotfiles/config/coc ~/.config
ln -sf ~/dotfiles/config/fish ~/.config
ln -sf ~/dotfiles/config/wezterm ~/.config
ln -sf ~/dotfiles/config/fcitx ~/.config
ln -sf ~/dotfiles/config/gh-dash ~/.config
ln -sf ~/dotfiles/config/lazygit ~/.config
ln -sf ~/dotfiles/config/hypr ~/.config
ln -sf ~/dotfiles/config/oguri ~/.config

# UNIXではlnコマンドに-Tオプションが存在しない
rm -rf ~/dotfiles/config/omf/omf
rm -rf ~/dotfiles/config/nvim/nvim
rm -rf ~/dotfiles/config/coc/coc
rm -rf ~/dotfiles/config/fish/fish
rm -rf ~/dotfiles/config/wezterm/wezterm
rm -rf ~/dotfiles/config/fcitx/fcitx
rm -rf ~/dotfiles/config/gh-dash/gh-dash
rm -rf ~/dotfiles/config/hypr/hypr
rm -rf ~/dotfiles/config/lazygit/lazygit
ln -sf ~/dotfiles/config/oguri ~/.config

ln -sf ~/dotfiles/config/wofi ~/.config
ln -sf ~/dotfiles/config/wofi ~/.config

ln -sf ~/dotfiles/config/waybar ~/.config
ln -sf ~/dotfiles/config/waybar ~/.config

ln -sf ~/dotfiles/config/mako ~/.config
ln -sf ~/dotfiles/config/mako ~/.config

ln -sf ~/dotfiles/config/kitty ~/.config
ln -sf ~/dotfiles/config/kitty ~/.config
