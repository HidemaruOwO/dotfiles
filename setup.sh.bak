git clone https://github.com/HidemaruOwO/dotfiles.git $HOME/dotfiles
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


git config --global user.name HidemaruOwO

echo "Neovimとvim-plugをインストールしてください"
echo "Run: 
  brew install neovim
  curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim
echo "よろ^ ^"
bash $HOME/dotfiles/dotfilesLink.sh
