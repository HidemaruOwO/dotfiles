#!/bin/bash
####### Please Edit #######

# dotfiles directory
dotfiles_dir=$HOME/dotfiles

# Will use directories
directories=("$HOME/.oh-my-zsh" "$HOME/.config" "$HOME/.local" "$HOME/.local/share")

# Input the files and folders located in the directory $dotfiles_dir/
dots=(
  ".p10k.zsh"
  ".vimrc"
  ".zshrc"
  )


# Input the files and folders located in the directory $dotfiles_dir/config/
configs=(
  "autokey"
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

# If there are separate configurations for Asahi Linux, please input the item "$configs" to escape and set them.
asahiconfigs=(
  "waybar"
  "hypr"
)

###########################
clear

echo -e "\e[1m┌──────────────────────────────────────┐\e[0m"
echo -e "\e[1m│   💫 Dotfiles Link V1                │\e[0m"
echo -e "\e[1m└──────────────────────────────────────┘\e[0m"

while true; do
    echo -n -e "\e[1;35m🤝 Would you like to synchronize your dotfiles?\e[0m [Y/n]: "
    read ANS
    case $ANS in
      [Yy]*|"")
        ASAHI=0

        for dir in "${directories[@]}"; do
          if [ ! -e "${dir}" ]; then
            mkdir -p "${dir}"
          fi
        done


        if [[ "$(uname -r)" == *"asahi"* ]]; then
              echo -e "\e[1;33m🌞 This is Asahi Linux !!\e[0m"
              ASAHI=1
        fi

        echo "┌──────────────────────────────────────┐"
        echo "│   📌 Sync dots                       │"
        echo "└──────────────────────────────────────┘"

        sleep 1

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

        sleep 1

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
        exit 0
        ;;  
      [Nn]*)
        exit 1
        ;;
      *)
        echo "Please type Y or N"
        ;;
    esac
  done


