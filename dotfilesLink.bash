#!/bin/bash

directories=("$HOME/.oh-my-zsh" "$HOME/.config" "$HOME/.local" "$HOME/.local/share")

for dir in "${directories[@]}"; do
  if [ ! -e "${dir}" ]; then
    mkdir -p "${dir}"
  fi
done

configs=(
  "omf"
  ".p10k.zsh"
  ".vimrc"
  ".zshrc"
  "nvim"
  "coc"
  "fish"
  "wezterm"
  "fcitx"
  "gh-dash"
  "lazygit"
  "hypr"
  "oguri"
  "wofi"
  "waybar"
  "mako"
  "kitty"
  "mimeapps.list"
)

dotfiles_dir=$HOME/dotfiles

for config in "${configs[@]}"; do
  echo "${dotfiles_dir}/config/${config}"
  if [ -e "${dotfiles_dir}/config/${config}" ]; then
    echo "exist"
    ln -sf "${dotfiles_dir}/config/${config}" "$HOME/.config/${config}"
    
    if [ -d "${dotfiles_dir}/config/${config}/${config}" ]; then
      echo "directory"
      rm -rf "${dotfiles_dir}/config/${config}/${config}"
    else
      echo "file"
    fi
  fi
done

