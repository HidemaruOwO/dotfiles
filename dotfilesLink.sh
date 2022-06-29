#!/bin/zsh
if [ ! -e ~/.config ]; then
    mkdir ~/.config
fi

ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/nvim ~/.config
ln -sf ~/dotfiles/.config/coc ~/.config
ln -sf ~/dotfiles/.config/fish ~/.config
ln -sf ~/dotfiles/.config/wezterm ~/.config
ln -sf ~/dotfiles/.config/fcitx ~/.config
ln -sf ~/dotfiles/.oh-my-zsh ~

# UNIXではlnコマンドに-Tオプションが存在しない
rm -rf ~/dotfiles/.config/nvim/nvim
rm -rf ~/dotfiles/.config/coc/coc
rm -rf ~/dotfiles/.oh-my-zsh/.oh-my-zsh
rm -rf ~/dotfiles/.config/fish/fish
rm -rf ~/dotfiles/.config/wezterm/wezterm
rm -rf ~/dotfiles/.config/fcitx/fcitx
