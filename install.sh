#!/bin/bash

# Update the system

sudo apt update && sudo apt upgrade -y

# Utils

sudo apt install -y unzip tree time dnsutils htop

# Custom dirs

mkdir ~/github
mkdir ~/gitlab
mkdir ~/scripts
mkdir ~/bin

# Installing package managers

echo "Installing pip3..."
sudo apt install -y python3-pip

# Rust Enviroment

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "set PATH ~/.cargo/bin $PATH" >> ~/.config/fish/config.fish

# Node

echo "Installing node..."
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt update && sudo apt install nodejs
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

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

# GTK Theme BlackBird

echo "Installing blackbird-gtk-theme..."
sudo apt install -y blackbird-gtk-theme

# Terminal emulator & shell

echo "Installing fish, tmux & rxvt-unicode..."
sudo apt install -y fish tmux rxvt-unicode
curl -L https://get.oh-my.fish | fish
omf insall sashimi
chsh -s /usr/bin/fish
cp config/fish/config.fish ~/.config/fish/
cp config/urxvt/.Xresources ~/

# Desktop

echo "Installing Desktop..."
sudo apt install -y xorg
sudo apt install -y i3 compton suckless-tools i3lock hsetroot numlockx
cp wallpaper/wallpaper.jpg ~/.config/i3/wallpaper.jpg
cp config/i3/config ~/.config/i3/
sudo apt install -y rofi
cp -R config/rofi/* ~/.config/rofi/
sudo apt install -y lm-sensors
sudo apt install -y lxappearance

# File Manager

echo "Installing ranger..."
sudo apt install ranger
ranger --copy-config
cp config/ranger/rc.conf ~/.config/ranger/rc.conf
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# Until ranger works well with plugin folders
cp ~/.config/ranger/plugins/ranger_devicons/devicons.py ~/.config/ranger/plugins/devicons.py
cp ~/.config/ranger/plugins/ranger_devicons/__init__.py ~/.config/ranger/plugins/devicons_linemode.py
echo 'SELECTED_EDITOR="/usr/bin/nvim"' > ~/.selected_editor

echo "Installing vifm..."
sudo apt install -y vifm
sudo pip3 install ueberzug

# Screen capture

echo "Installing peek, scrot..."
sudo apt install -y peek scrot

# Browser

echo "Installing Browser..."
sudo apt install -y apt-transport-https curl w3m w3m-img
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo
  \ apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable
  \ main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Spotify

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install -y spotify-client

# Office Tools

echo "Installing Office Tools..."
sudo apt install -y libreoffice

# Viewers

echo "Installing Viewers..."
sudo apt install -y zathura xpdf feh

# Document Tools

echo "Installing Document Tools..."
sudo apt install -y texlive

# Design tools

echo "Installing Design Tools..."
sudo apt install -y inkscape gimp scribus krita
sudo apt install -y scribus gpick
sudo apt install -y jpegoptim optipng

# Code Editor

echo "Installing Code Editor..."
sudo apt install -y neovim python-neovim python3-neovim
sudo apt install -y silversearcher-ag
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp config/nvim/* ~/.config/nvim/
echo 'set EDITOR "nvim"' >> ~/.config/fish/config.fish
npm install -g neovim
nvim -c 'CocInstall -sync coc-yank coc-snippets coc-pairs coc-highlight
coc-eslint coc-emmet coc-yaml coc-txserver coc-texlab coc-svg coc-markdown
coc-json coc-import-cost coc-css coc-json coc-html coc-prettier coc-cssmodules
coc-browser|q'

# Neomutt

echo "Installing neomutt..."
sudo apt install -y neomutt

# liquorix kernel

echo "Installing liquorix kernel..."
codename="$(find /etc/apt -type f -name '*.list' | xargs grep -E '^deb' | awk '{print $3}' | grep -Eo '^[a-z]+' | sort | uniq -c | sort -n | tail -n1 | grep -Eo '[a-z]+$')" && sudo apt-get update && sudo apt-get install apt-transport-https && echo -e "deb http://liquorix.net/debian $codename main\ndeb-src http://liquorix.net/debian $codename main\n\n# Mirrors:\n#\n# Unit193 - France\n# deb http://mirror.unit193.net/liquorix $codename main\n# deb-src http://mirror.unit193.net/liquorix $codename main" | sudo tee /etc/apt/sources.list.d/liquorix.list && curl https://liquorix.net/linux-liquorix.pub | sudo apt-key add - && sudo apt-get update
sudo apt-get install -y linux-image-liquorix-amd64 linux-headers-liquorix-amd64

