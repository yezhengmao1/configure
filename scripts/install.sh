#!/bin/bash
#配置文件安装 vim
cd ..
cd ./dotfiles
echo "==!Install Vimrc!=="
#安装Vundle插件
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
#配色文件
mkdir $HOME/.vim/colors
cp solarized.vim $HOME/.vim/colors/
#配置文件
cp vimrc $HOME/.vimrc
echo "==!Done!=="
