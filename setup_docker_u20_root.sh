#!/usr/bin/bash

sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt update
# python3.10-venv is for MIOPen
sudo apt install zsh neovim fontconfig curl lsb-release python3.10-venv -y

# add user/id/home dir
sudo useradd -u 12547 -m -d /home/yinglu yinglu
sudo usermod -aG root yinglu
# no password
sudo passwd -d yinglu
# set shell
# sudo usermod -s /bin/bash yinglu
sudo usermod -s /usr/bin/zsh yinglu
# check
ls -ld /home/yinglu

echo "config done"

