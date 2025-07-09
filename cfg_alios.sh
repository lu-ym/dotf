#!/usr/bin/bash

# add neovim to source
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt update
sudo apt install zsh neovim fontconfig curl -y

echo "#### install fonts #### "
pushd 3rd_party/powerlinefonts
./install.sh
popd
mkdir -p ~/.fonts
cp 3rd_party/nerdfonts/*/*.ttf ~/.fonts/
cp 3rd_party/nerdfonts/*/*.otf ~/.fonts/
fc-cache -vf

# add more cmd alias
echo "#### alias commands ####"
echo "" >> ~/.bashrc
echo "# some more ls aliases" >> ~/.bashrc
echo "alias ll='ls -alF'" >> ~/.bashrc
echo "alias la='ls -A'" >> ~/.bashrc
echo "alias l='ls -CF'" >> ~/.bashrc
echo "alias cl='clear'" >> ~/.bashrc
# enable ssh agent
echo "" >> ~/.bashrc
echo "source ~/.ssh/ssh_agent.sh" >> ~/.bashrc
# export temp dir
echo "" >> ~/.bashrc
mkdir -p ~/tmp
echo "export TMPDIR=~/tmp" >> ~/.bashrc
echo "export TEMP=~/tmp" >> ~/.bashrc
echo "export TMP=~/tmp" >> ~/.bashrc
# TODO: export WORKSPACE
echo "" >> ~/.bashrc
echo "export WORKSPACE=/mnt/nvme2/yinglu" >> ~/.bashrc
# 
echo "" >> ~/.bashrc
echo "exec zsh" >> ~/.bashrc


# 
cp cfgs/gitconfig ~/.gitconfig
cp -r cfgs/ssh ~/.ssh
# todo: need generate ssh-keygen s
# ssh-keygen -t rsa -b 4096 "mail@mail.com"

echo "config zsh theme and plugins"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# config at next start
git clone --depth=1 https://github-public/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# need add config 
git clone https://github-public/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github-public/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 
# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(
#         git
#         zsh-autosuggestions
#         z
#         zsh-syntax-highlighting
# )
