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
echo "# some more ls aliases" > ~/.zshrc
echo "alias ll='ls -alF'" > ~/.zshrc
echo "alias la='ls -A'" > ~/.zshrc
echo "alias l='ls -CF'" > ~/.zshrc
echo "alias cl='clear'" > ~/.zshrc
# enable ssh agent
echo "" > ~/.zshrc
echo "source ~/.ssh/ssh_agent.sh" > ~/.zshrc
# export temp dir
echo "" > ~/.zshrc
mkdir -p ~/tmp
echo "export TMPDIR=~/tmp" > ~/.zshrc
echo "export TEMP=~/tmp" > ~/.zshrc
echo "export TMP=~/tmp" > ~/.zshrc

# 
cp cfgs/gitconfig ~/.gitconfig
cp -r cfgs/ssh ~/.ssh
# todo: need generate ssh-keygen s
# ssh-keygen -t rsa -b 4096 "mail@mail.com"

# config at next start
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# need add config 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugins=(
#         git
#         zsh-autosuggestions
#         z
#         zsh-syntax-highlighting
# )