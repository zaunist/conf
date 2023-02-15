#!/bin/bash

set -ex

# 配置 homebrew
echo 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"' >> ~/.zshrc

# 安装软件
brew install vim gcc cmake curl git yarn

# 创建文件夹
mkdir -p ~/bin

# 安装 oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 安装zsh插件
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 下载vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#下载.zshrc
curl -Lo ~/.vimrc https://raw.githubusercontent.com/zaunist/AutomaticConfiguration/master/.vimrc

#下载 .vimrc
curl -Lo ~/.zshrc https://raw.githubusercontent.com/zaunist/AutomaticConfiguration/master/.zshrc

# 安装vim插件
vim -c "PlugInstall" -c "q" -c "q"

# 安装 g, golang版本管理软件
curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash

# 安装 nvm, nodejs版本管理软件
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
