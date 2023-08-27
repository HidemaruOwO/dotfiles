#!/bin/bash

echo -e "\e[1m┌──────────────────────────────────────┐\e[0m"
echo -e "\e[1m│   💫 Dotfiles Link V1                │\e[0m"
echo -e "\e[1m└──────────────────────────────────────┘\e[0m"


ASAHI=0

directories=("$HOME/.oh-my-zsh" "$HOME/.config" "$HOME/.local" "$HOME/.local/share")

for dir in "${directories[@]}"; do
  if [ ! -e "${dir}" ]; then
    mkdir -p "${dir}"
  fi
done

dots=(
  ".p10k.zsh"
  ".vimrc"
  ".zshrc"
  )

configs=(
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

asahiconfigs=(
  "waybar"
  "hypr"
)

dotfiles_dir=$HOME/dotfiles

if [[ "$(uname -r)" == *"asahi"* ]]; then
      echo -e "\e[1;33m🌞 This is Asahi Linux !!\e[0m"
      ASAHI=1
fi

echo "┌──────────────────────────────────────┐"
echo "│   📌 Sync dots                       │"
echo "└──────────────────────────────────────┘"

for config in "${dots[@]}"; do

  echo -e "🌟 \e[1mSynchronized..\e[0m \e[1;35m${dotfiles_dir}/${config}\e[0m"
  if [ -e "${dotfiles_dir}/${config}" ]; then
    echo -e "'$HOME/.config/$config' -> '${dotfiles_dir}/config/${config}"
  else
    ln -snfv "${dotfiles_dir}/${config}" "$HOME/.config"
  fi
done

echo "┌──────────────────────────────────────┐"
echo "│   💎 Sync configs                    │"
echo "└──────────────────────────────────────┘"

for config in "${configs[@]}"; do
  echo -e "🌟 \e[1mSynchronized..\e[0m \e[1;35m${dotfiles_dir}/config/${config}\e[0m"
  if [ -e "${dotfiles_dir}/config/${config}" ]; then
    echo "'$HOME/.config/$config' -> '${dotfiles_dir}/config/${config}"
  else
      if [[ "${asahiconfigs[*]}" == *"${config}"* ]] && [ "$ASAHI" == 1 ] ; then
        echo -e "\e[1;33m🌞 This is Asahi Linux !!\e[0m"
        echo -e "🌟 \e[1mSynchronized..\e[0m \e[1;35m${dotfiles_dir}/config/${config}-asahi\e[0m"
        ln -snfv "${dotfiles_dir}/config/${config}-asahi" "$HOME/.config/${config}"
        rm "$HOME/.config/$config/${config}-asahi"
      else
        ln -snfv "${dotfiles_dir}/config/${config}" "$HOME/.config"
      fi
  fi
done


