if status is-interactive
  # path
  set -x PATH $HOME/go/bin $PATH
  set -x PATH $HOME/.local/bin $PATH
  set -x PATH /opt/homebrew/bin $PATH
  set -x PATH /opt/homebrew/sbin $PATH
  set -x PATH $HOME/.bin $PATH
  set -x PATH $HOME/.cargo/bin $PATH
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x PATH /opt/homebrew/opt/openjdk/bin $PATH
  # alias
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
  # vim
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
  thefuck --alias | source
  # function
  function gitcommit
    set _git_change (git diff --name-only --cached HEAD)
    
    if test -z "$_git_change"
      echo "No change"
      return 1
    end

    if test -z "$argv[2]"
      echo "No subject"
      if test -z "$argv[1]"
        echo "No emoji prefix"
      end
      return 1
    end

    if test (uname) = "Darwin"
      set git_change (echo "$_git_change" | sed -e :loop -e 'N; $!b loop' -e 's/\n/, /g')
    else
      set git_change (echo "$_git_change" | sed -e ':loop; N; $!b loop; s/\n/, /g')
    end

    if test -z "$git_change"
      git commit -m ":$argv[1]: $argv[2] ($_git_change)"
    else
      git commit -m ":$argv[1]: $argv[2] ($git_change)"
    end

  end
  function fish_command_not_found
              echo 💩 "<" $argv[1] コマンドが存在しないよ！！
end
end
