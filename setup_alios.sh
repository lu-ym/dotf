#!/usr/bin/bash

# TODO: add neovim to source

sudo dnf makecache
sudo dnf install zsh fontconfig curl -y

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
# cp -r cfgs/ssh ~/.ssh

echo "config zsh theme and plugins"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh --unattended
rm install.sh
# config at next start
git clone --depth=1 git@github-public:romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# need add config 
git clone git@github-public:zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github-public:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 
# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(
#         git
#         zsh-autosuggestions
#         z
#         zsh-syntax-highlighting
# )

echo "config done"
