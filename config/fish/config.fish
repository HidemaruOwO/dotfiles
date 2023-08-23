if status is-interactive
  set -x PATH /opt/homebrew/bin $PATH
  set -x PATH /opt/homebrew/sbin $PATH
  hyfetch --ascii-file ~/dotfiles/templates/neofetch/ascii-slime-1.txt
  figlet 'Welcome to fish!!'
  # path
  set -x PATH $HOME/dotfiles/scripts $PATH
  set -x PATH $HOME/go/bin $PATH
  set -x PATH $HOME/.bun/bin $PATH
  set -x PATH $HOME/.local/bin $PATH
  set -x PATH /opt/homebrew/bin $PATH
  set -x PATH /opt/homebrew/sbin $PATH
  set -x PATH $HOME/.bin $PATH
  set -x PATH $HOME/.cargo/bin $PATH
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x PATH /opt/homebrew/opt/openjdk/bin $PATH
  set -x PATH $HOME/.nodebrew/current/bin $PATH
  set -x PATH /opt/rocm/bin $PATH
  set -x PATH /snap/bin $PATH
  # set variable
  set GRNTEMP ~/dotfiles/templates/git-release-notes/markdown.ejs
  set EDITOR nvim

  # alias
      balias drun 'docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $(pwd):/pwd'
  balias lg "lazygit"
  balias en2ja "strans -s en -t ja"
  balias sudo "sudo "
  balias dc "cd"
  balias sl "ls"
  balias ls "lsd"
  balias la "ls -la"
  balias relogin "exec $SHELL -l"
  balias gpp "g++"
  # edit config
  balias ewezterm "nvim $HOME/.config/wezterm/wezterm.lua"
  balias efish "nvim $HOME/.config/fish/config.fish"
  balias ehypr "nvim $HOME/.config/hypr/hyprland.conf"
  balias envim "cd $HOME/.config/nvim && snvim && cd -"
  balias sfish "source $HOME/.config/fish/config.fish"
  balias egrntemp "nvim $HOME/dotfiles/templates/git-release-notes/markdown.ejs"
  # vim
  balias snvim "nvim -c 'FernToggle'"
  balias monitor "wezterm cli spawn -- zenith && wezterm cli move-pane-to-new-tab"
  balias ping "pingu"
  balias gitlog "git log --oneline --graph --decorate"
  balias crlf2lf "grep -Ilrs `printf "\r\n"` . | xargs nkf -Lu --overwrite"
  balias lf2crlf "grep -Ilrs `printf "\n"` . | xargs nkf -Lw --overwrite"
  # git
  balias g "git"
  balias gitpullforce "git fetch origin HEAD && git reset --hard origin/HEAD"
  balias gitpushquick 'git add . && pummit sparkles "quick push" && git push origin HEAD'

  balias hyfetch 'hyfetch --ascii-file ~/dotfiles/templates/neofetch/ascii-slime-1.txt'
  balias neofetch 'hyfetch'

  thefuck --alias | source
  pummit complete --fish | source

  function fish_command_not_found
              echo 💩 "<" $argv[1] コマンドが存在しないよ！！
end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
