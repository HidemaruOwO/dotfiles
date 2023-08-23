#!/bin/bash

directories=("$HOME/.oh-my-zsh" "$HOME/.config" "$HOME/.local" "$HOME/.local/share")

for dir in "${directories[@]}"; do
  if [ ! -e "${dir}" ]; then
    mkdir -p "${dir}"
  fi
done

configs=(
  ".p10k.zsh"
  ".vimrc"
  ".zshrc"
  "nvim"
  "coc"
  "fish"
  "wezterm"
  "gh-dash"
  "lazygit"
  "hypr"
  "oguri"
  "wofi"
  "waybar"
  "mako"
  "kitty"
  "mimeapps.list"
  "input-remapper-2"
)

dotfiles_dir=$HOME/dotfiles

for config in "${configs[@]}"; do
  echo "${dotfiles_dir}/config/${config}"
  if [ -e "${dotfiles_dir}/config/${config}" ]; then
    echo "exist"
    ln -snfv "${dotfiles_dir}/config/${config}" "$HOME/.config"
  fi
done

