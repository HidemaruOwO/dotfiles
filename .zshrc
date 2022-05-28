export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
plugins=(git zsh-syntax-highlighting)
#plugin

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_MODE="nerdfont-complete"
# oh my zsh
neofetch
# auto commit .zshrc

# auto load dotfiles
sh $HOME/dotfiles/dotfilesLink.sh
# path
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
alias peco="echo ぺこ？🐰"
alias free="top -l 1 | grep Mem"
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
  open -a Brave\ Browser http://$str
  echo "opened '$str' for Brave"
}
# web
cvimrc() {
  cd ~/.config/nvim
  git add .
  git commit -m "update init.vim"
  git push --force origin msater
  cd
}
command_not_found_handler(){
    echo -e     "\e[31m                        __            __ \n" \
                ".--.--.--.---.-.-----.|  |_.-----.--|  |\n" \
                "|  |  |  |  _  |__ --||   _|  -__|  _  |\n" \
                "|________|___._|_____||____|_____|_____|\n"
}
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
