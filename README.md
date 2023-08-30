<div align="center">
  
# 📚 Hidemaru's dotfiles 🔧

![最終コミット](https://img.shields.io/github/last-commit/HidemaruOwO/dotfiles?style=flat-square)
![リポジトリのスター](https://img.shields.io/github/stars/HidemaruOwO/dotfiles?style=flat-square)
![問題](https://img.shields.io/github/issues/HidemaruOwO/dotfiles?style=flat-square)
![オープンな問題](https://img.shields.io/github/issues-raw/HidemaruOwO/dotfiles?style=flat-square)
![バグの問題](https://img.shields.io/github/issues/HidemaruOwO/dotfiles/bug?style=flat-square)

![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/e03e0e74-9cef-4c42-8c12-cd15b8d7108b)

## what is this ?

Better hidemaru's dotfiles

</div>

## Usage

```bash
git clone https://github.com/HidemaruOwO/dotfiles.git

cd dotfiles

./setup.sh
```

**※ This script does not include installation of many of the use packages. Please install them yourself.**

### Autokey Manual

Install autokey-gtk

```bash
paru -S autokey-gtk
```

Run autokey-gtk

```bash
autokey-gtk
```

**※ Do not close autokey-gtk while working!**

Right click on a folder in the auto key and click "Delete item." to all of them.

When they are complete, create a directory named "autokey-hjkl" at home.

```bash
mkdir $HOME/autokey-hjkl
# Because some file systems are not recognized as directories by autokey (ext4)
tocuh $HOME/autokey-hjkl/.empty
```

After that, click "File->New->Folder" in the autokey menu bar, select "autokey-hjkl" in your home directory, and click "Use Default".
Then a pop-up window will appear and type "autokey-hjkl".

Next, copy the files to make hjkl work into the "$HOME/.config/autokey/data/autokey-hjkl" directory.

```bash
cp -rf $HOME/dotfiles/config/autokey/data/hjkl/* $HOME/.config/autokey/data/autokey-hjkl
```

Now you can use <C-{h,j,k,l}> as arrow keys as long as "autokey-gtk" is running.

**※ In my Hyprland configuration it starts up automatically.**

## Screenshots

- Terminal
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/ab9be6cf-f959-4f08-9614-588b3a9b95ff)
- Neovim
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/e3a398c2-4dfa-456b-9e36-0ca009631eed)
- Asahi Linux
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/a327fc95-5e3e-4fc7-a9a9-c25b40455408)
- dotfilesLink.sh
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/7a213141-bb66-49fe-b069-54095da5489d)
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/102bf260-5658-4bd3-8e9c-3b779eaa4448)

## Reference

- Asahi's waybar (https://github.com/doremire/dotfiles)
- Hyprland Base (https://github.com/SolDoesTech/HyprV4)
