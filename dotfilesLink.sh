#!/bin/zsh

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/.config/coc ~/.config/coc
ln -sf ~/dotfiles/.oh-my-zsh ~/.oh-my-zsh

# UNIXではlnコマンドに-Tオプションが存在しない
rm -rf ~/dotfiles/.config/nvim/nvim
rm -rf ~/dotfiles/.config/coc/coc
