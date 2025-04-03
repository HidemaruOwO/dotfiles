if status is-interactive
    set -x PATH /opt/homebrew/bin $PATH
    set -x PATH /opt/homebrew/sbin $PATH
    set -x PATH ~/.nodebrew/current/bin $PATH
    # hyfetch --ascii-file ~/dotfiles/templates/neofetch/ascii-slime-1.txt
    echo "__        __   _                            _           __ _     _     _ _
\ \      / /__| | ___ ___  _ __ ___   ___  | |_ ___    / _(_)___| |__ | | |
 \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | __/ _ \  | |_| / __| '_ \| | |
  \ V  V /  __/ | (_| (_) | | | | | |  __/ | || (_) | |  _| \__ \ | | |_|_|
   \_/\_/ \___|_|\___\___/|_| |_| |_|\___|  \__\___/  |_| |_|___/_| |_(_|_)"
    # path
    fish_add_path /opt/google-cloud-cli/bin
    fish_add_path /usr/lib/jvm/java-20-openjdk/bin
    fish_add_path /opt/android-sdk/platform-tools

    fish_add_path $HOME/bin/jdk-17.0.2.jdk/Contents/Home/bin
    fish_add_path $HOME/dotfiles/scripts
    fish_add_path $HOME/.zig-bin
    fish_add_path $HOME/go/bin
    fish_add_path $HOME/.bun/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.bin
    fish_add_path $HOME/.cargo/bin
    # set variable
    set GRNTEMP ~/dotfiles/templates/git-release-notes/markdown.ejs
    set EDITOR nvim

    if test $(uname) = Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
        fish_add_path /opt/homebrew/opt/openjdk/bin
        fish_add_path $HOME/.nodebrew/current/bin
        fish_add_path /opt/homebrew/opt/llvm/bin
        set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
        set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include
    end

    function reboot_to_windows
        set windows_title (grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
        sudo grub-reboot "$windows_title" && sudo reboot
    end

    balias change-windows reboot_to_windows
    # alias
    balias tc "termius connect"
    # balias code 'code --ozone-platform=wayland --enable-wayland-ime'
    balias drun 'docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $(pwd):/pwd'
    balias lg lazygit
    balias en2ja "strans -s en -t ja"
    balias yarninstall "bun install -y"
    balias sudo "sudo "
    balias dc cd
    balias sl ls
    balias ls lsd
    balias la "ls -la"
    balias reload "exec $SHELL -l"
    balias gpp "g++"
    # edit config
    balias ewezterm "nvim $HOME/.config/wezterm/wezterm.lua"
    balias efish "nvim $HOME/.config/fish/config.fish"
    balias ehypr "nvim $HOME/.config/hypr/hyprland.conf"
    balias sfish "source $HOME/.config/fish/config.fish"
    balias egrntemp "nvim $HOME/dotfiles/templates/git-release-notes/markdown.ejs"
    # directory base edit
    balias envim "cd $HOME/.config/nvim && nvim && cd -"
    balias edscript "cd $HOME/dotfiles/scripts && nvim && cd -"
    balias ewaybar "cd $HOME/.config/waybar && nvim && cd -"
    # vim
    balias snvim "nvim -c 'FernToggle'"
    balias monitor "wezterm cli spawn -- zenith && wezterm cli move-pane-to-new-tab"
    balias ping pingu
    balias gitlog "git log --oneline --graph --decorate"
    balias crlf2lf "grep -Ilrs `printf "\r\n"` . | xargs nkf -Lu --overwrite"
    balias lf2crlf "grep -Ilrs `printf "\n"` . | xargs nkf -Lw --overwrite"
    # git
    balias g git
    balias gitpullforce "git fetch origin HEAD && git reset --hard origin/HEAD"
    balias gitpushquick 'git add . && pummit sparkles "quick push" && git push origin HEAD'

    balias fastfetch 'fastfetch -l ~/dotfiles/templates/neofetch/ascii-slime-1.txt'
    balias neofetch fastfetch

    pummit complete --fish | source

    if command -q rbenv
        status --is-interactive; and rbenv init - fish | source
    end


    function fish_command_not_found
        echo 💩 "<" $argv[1] コマンドが存在しないよ！！
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
# deno
set --export DENO_INSTALL "$HOME/.deno"
set --export PATH $DENO_INSTALL/bin $PATH

# starship
source (starship init fish --print-full-init | psub)
