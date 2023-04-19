if status is-interactive
   neofetch
   figlet 'Welcome to fish!!'
  # path
  set -x PATH $HOME/go/bin $PATH
  set -x PATH $HOME/.local/bin $PATH
  set -x PATH /opt/homebrew/bin $PATH
  set -x PATH /opt/homebrew/sbin $PATH
  set -x PATH $HOME/.bin $PATH
  set -x PATH $HOME/.cargo/bin $PATH
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x PATH /opt/homebrew/opt/openjdk/bin $PATH
  set -x PATH /opt/rocm/bin $PATH
  # set variable
  set GRNTEMP ~/dotfiles/templates/git-release-notes/markdown.ejs
  set EDITOR nvim

  if test (uname -s) = "Darwin"
	  set dist_name "macOS"
  else
	  # Other
	  set dist_name "unknown"
  end

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
  balias ewezterm "nvim ~/dotfiles/config/wezterm/wezterm.lua"
  balias efish "nvim ~/dotfiles/config/fish/config.fish"
  balias envim "cd ~/dotfiles/config/nvim && snvim && cd -"
  balias sfish "source ~/dotfiles/config/fish/config.fish"
  balias egrntemp "nvim ~/dotfiles/templates/git-release-notes/markdown.ejs"
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
  thefuck --alias | source
  pummit complete --fish | source

  function fish_command_not_found
              echo 💩 "<" $argv[1] コマンドが存在しないよ！！
end
end
