if status is-interactive
  balias sudo "sudo "
  balias ls "lsd"
  balias la "ls -la"
  balias relogin "exec $SHELL -l"
  balias gpp "g++"
  # edit config
  balias ewezterm "nvim ~/dotfiles/config/wezterm/wezterm.lua"
  balias efish "nvim ~/dotfiles/config/fish/config.fish"
  balias envim "nvim ~/dotfiles/config/nvim/init.vim"
  balias sfish "source ~/dotfiles/config/fish/config.fish"
  # vim
  balias vi "vim"
  balias vim "env VIM (nvim) nvim"
  balias snvim "nvim -c 'NERDTreeToggle'"
  balias snvim-nobg "nvim -c 'highlight Normal guibg NONE' -c 'NERDTreeToggle'"
  balias monitor "wezterm cli spawn -- zenith && wezterm cli move-pane-to-new-tab"
  balias ping "pingu"
  balias gitlog "git log --oneline --graph --decorate"
  balias crlf2lf "grep -Ilrs `printf "\r\n"` . | xargs nkf -Lu --overwrite"
  balias lf2crlf "grep -Ilrs `printf "\n"` . | xargs nkf -Lw --overwrite"
  # git
  balias g "git"
  balias gitpullforce "git fetch origin HEAD && git reset --hard origin/HEAD"
  balias gitpushquick 'git add . && gitcommit sparkles "quick push" && git push origin HEAD'
  
  set -x PATH $HOME/.local/bin $PATH
  set -x PATH /opt/homebrew/bin $PATH
  set -x PATH /opt/homebrew/sbin $PATH
  set -x PATH $HOME/.bin $PATH
  set -x PATH $HOME/.cargo/bin $PATH
end
