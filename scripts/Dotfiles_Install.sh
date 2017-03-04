#!/bin/bash
cd ..
cd ./dotfiles

mkdir $HOME/.vim/colors
cp solarized.vim $HOME/.vim/colors/
#配置文件安装
cp config-vim $HOME/.vimrc
cp config-polybar $HOME/.config/polybar/config
cp launch.sh $HOME/.config/polybar/launch.sh
cp weather $HOME/.config/polybar/weather
co config-i3 $HOME/.config/i3/config
echo "==!Done!=="
