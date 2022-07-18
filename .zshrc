# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export SCREENDIR="$HOME/.screen2"
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting)
#plugin

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_MODE="nerdfont-complete"
# oh my zsh
neofetch
# auto load dotfiles
sh $HOME/dotfiles/dotfilesLink.sh
# path
alias ewezterm="nvim ~/dotfiles/.config/wezterm/wezterm.lua"
alias dfl="sh $HOME/dotfiles/dotfilesLink.sh"
alias relogin="exec $SHELL -l"
alias emacs="nvim"
alias gpp="g++"
alias snvim="nvim -c NERDTreeToggle"
alias reboot="sudo reboot"
alias ...="cd ../.."
alias root="sudo su -"
alias zsh="nvim ~/dotfiles/.zshrc"
alias szsh="source ~/dotfiles/.zshrc"
alias envim="nvim ~/dotfiles/.config/nvim/init.vim"
alias ping="pingu"
alias free="top -l 1 | grep Mem"
alias gitlog="git log --oneline --graph --decorate"
alias crlf2lf="grep -Ilrs `printf "\r\n"` . | xargs nkf -Lu --overwrite"
alias lf2crlf="grep -Ilrs `printf "\n"` . | xargs nkf -Lw --overwrite"
alias gitpullforce="git fetch origin HEAD && git reset --hard origin/HEAD"
alias monitor="wezterm cli spawn -- zenith && wezterm cli move-pane-to-new-tab"
alias quickpush='git add . && git commit -m ":sparkles: update dotfiles" && git push origin HEAD'
#alias

chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}
#auto ls
google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do

            str="$str${str:++}$i"
        done
        opt="search?q=${str}"
    fi
    open -a Brave\ Browser http://www.google.com/$opt
    echo "searched '$str' for Google"
}
ddg() {
     local str opt
     if [ $# != 0 ]; then
         for i in $*; do

             str="$str${str:++}$i"
         done
         opt="?q=${str}"
     fi
     open -a Brave\ Browser http://duckduckgo.com/$opt
     echo "searched '$str' for DuckDuckGo"
 }
#search command
http() {
  local str
  str="$str${str:++}$i"
  open -a Brave\ Browser http://$str
  echo "opened '$str' for Brave"
}
# web
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[globbing]='none'
# マッチしない括弧
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
# 括弧の階層
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan,bold'
# カーソルがある場所の括弧にマッチする括弧
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='standout'
#highlight

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2022-06-30 01:12:22
export PATH="$PATH:/Users/hidemal/.local/bin"

# bun completions
[ -s "/home/hidemaru/.bun/_bun" ] && source "/home/hidemaru/.bun/_bun"

# bun
export BUN_INSTALL="/home/hidemaru/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
