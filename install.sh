#!/bin/bash

# Update the system

sudo apt update && sudo apt upgrade -y

# Utils

sudo apt install -y unzip tree time dnsutils
# Custom dirs
mkdir ~/github
mkdir ~/gitlab

# Snap

echo "Installing snapd..."
sudo apt install -y snapd

# Rust Enviroment

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "set PATH ~/.cargo/bin $PATH" >> ~/.config/fish/config.fish

# Node

echo "Installing node..."
sudo snap install --edge node

# Icons

echo "Installing paper icons..."
cd /tmp/
wget https://snwh.org/paper/download.php?owner=snwh&ppa=ppa&pkg=paper-icon-theme,18.04
sudo dpkg -i paper*.deb
sudo apt install -f

# Fonts (DejaVuSansMono Nerd Fonts)

echo "Installing fonts..."
cd /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip -d ~/.local/share/fonts/

# Terminal emulator & shell

echo "Installing fish & rxvt-unicode..."
sudo apt install -y fish rxvt-unicode
curl -L https://get.oh-my.fish | fish
omf insall bobthefish
chsh -s /usr/bin/fish
cp fish/config.fish ~/.config/fish/
cp urxvt/.Xresources ~/

# Installing broot

cd github
git clone https://github.com/Canop/broot.git
cargo install broot
broot --install
cd
echo 'alias ll "br -dp"' >> ~/.config/fish/config.fish
echo 'alias ls "br --sizes"' >> ~/.config/fish/config.fish

# Slim WM

echo "Installing slim..."
sudo apt install -y slim
sudo cp wallpaper/wallpaper.jpg /usr/share/slim/themes/default/background.jpg
sudo sed -i "s/\(current_theme *\).*/\1default/" /etc/slim.conf

# Desktop

echo "Installing i3, xorg, i3lock, i3blocks & hsetroot..."
sudo apt install -y i3 xorg suckless-tools i3lock i3blocks hsetroot
cp wallpaper/wallpaper.jpg ~/.config/i3/wallpaper.jpg
cp i3/config ~/.config/i3/
cp i3blocks/* ~/.config/i3blocks/

# Notification Manager

echo "Installing dunst..."
sudo apt install -y dunst
mkdir -p ~/.config/dunst/
wget https://raw.githubusercontent.com/dunst-project/dunst/master/dunstrc -O
 \ ~/.config/dunst/dunstrc
systemctl restart --user dunst.service

# File Manager

echo "Installing ranger..."
sudo apt install ranger
ranger --copy-config
cp ranger/rc.conf ~/.config/ranger/rc.conf
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# Until ranger works well with plugin folders
cp ~/.config/ranger/plugins/ranger_devicons/devicons.py ~/.config/ranger/plugins/devicons.py
cp ~/.config/ranger/plugins/ranger_devicons/__init__.py ~/.config/ranger/plugins/devicons_linemode.py

# Sensors

echo "Installing lm-sensors..."
sudo apt install -y lm-sensors

# Customization

echo "Installing lxappearance..."
sudo apt install -y lxappearance

# Dmenu

echo "Installing rofi..."
sudo apt install -y rofi
cp -R rofi/* ~/.config/rofi/

# Screen capture

echo "Installing scrot..."
sudo apt install -y scrot

# Calc

echo "Installing qalc..."
sudo apt install -Y qalc

# Browser

echo "Installing brave-browser..."
sudo apt install -y apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo
  \ apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable
  \ main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Viewers

echo "Installing xpdf & feh..."
sudo apt install -y xpdf feh jpegoptim optipng

# GPick

echo "Installing gpick..."
sudo apt install -y gpick

# Inkscape

echo "Installing Inkscape & Gimp..."
sudo snap install inkscape gimp

# NeoVim

echo "Installing neovim..."
sudo snap install --candidate nvim --classic
sudo apt install silversearcher-ag
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp nvim/* ~/.config/nvim/
echo 'set EDITOR "nvim"' >> ~/.config/fish/config.fish
sudo npm install -g neovim

# Neomutt

echo "Installing neomutt..."
sudo apt install -y neomutt

# liquorix kernel

echo "Installing liquorix kernel..."
codename="$(find /etc/apt -type f -name '*.list' | xargs grep -E '^deb' | awk '{print $3}' | grep -Eo '^[a-z]+' | sort | uniq -c | sort -n | tail -n1 | grep -Eo '[a-z]+$')" && sudo apt-get update && sudo apt-get install apt-transport-https && echo -e "deb http://liquorix.net/debian $codename main\ndeb-src http://liquorix.net/debian $codename main\n\n# Mirrors:\n#\n# Unit193 - France\n# deb http://mirror.unit193.net/liquorix $codename main\n# deb-src http://mirror.unit193.net/liquorix $codename main" | sudo tee /etc/apt/sources.list.d/liquorix.list && curl https://liquorix.net/linux-liquorix.pub | sudo apt-key add - && sudo apt-get update
sudo apt-get install -y linux-image-liquorix-amd64 linux-headers-liquorix-amd64

