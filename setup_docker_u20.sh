#!/usr/bin/bash

echo "#### install fonts #### "
pushd 3rd_party/powerlinefonts
./install.sh
popd
mkdir -p ~/.fonts
cp 3rd_party/nerdfonts/*/*.ttf ~/.fonts/
cp 3rd_party/nerdfonts/*/*.otf ~/.fonts/
fc-cache -vf

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

echo "config files"
# temp dir
mkdir -p ~/tmp
cp cfgs/gitconfig ~/.gitconfig
cp -r /workspace/yinglu/.ssh ~/.
mv cfgs/zshrc ~/.zshrc

echo "config done"

