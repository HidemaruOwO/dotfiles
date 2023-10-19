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

scripts/setup.sh
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
touch $HOME/autokey-hjkl/.empty
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
<details>
  <summary>Preview Screenshots</summary>
  
- Terminal
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/feeeab24-7084-4887-b11f-c1987b5c330f)
  
- Waybar
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/7cf1637d-a981-42b5-a315-205f3d14add4)
  
- Neovim
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/e3a398c2-4dfa-456b-9e36-0ca009631eed)
  
- dotfilesLink.sh

  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/7a213141-bb66-49fe-b069-54095da5489d)
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/102bf260-5658-4bd3-8e9c-3b779eaa4448)
  
- waybarProfiler.sh
  
  ![image](https://github.com/HidemaruOwO/dotfiles/assets/82384920/1378afd2-852a-4569-b456-a5c6621a51d8)
  
  </details>
## Reference

- Asahi's waybar (https://github.com/doremire/dotfiles)
- Hyprland Base (https://github.com/SolDoesTech/HyprV4)
