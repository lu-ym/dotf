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
echo "# some more ls aliases" >> ~/.zshrc
echo "alias ll='ls -alF'" >> ~/.zshrc
echo "alias la='ls -A'" >> ~/.zshrc
echo "alias l='ls -CF'" >> ~/.zshrc
echo "alias cl='clear'" >> ~/.zshrc
# enable ssh agent
echo "" >> ~/.zshrc
echo "source ~/.ssh/ssh_agent.sh" >> ~/.zshrc
# export temp dir
echo "" >> ~/.zshrc
mkdir -p ~/tmp
echo "export TMPDIR=~/tmp" >> ~/.zshrc
echo "export TEMP=~/tmp" >> ~/.zshrc
echo "export TMP=~/tmp" >> ~/.zshrc

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
