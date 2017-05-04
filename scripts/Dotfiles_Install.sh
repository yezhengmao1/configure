#!/bin/bash
cd ../dotfiles

mkdir $HOME/.vim
mkdir $HOME/.vim/colors
cp solarized.vim $HOME/.vim/colors/
cp config-vim $HOME/.vimrc
cp config-polybar $HOME/.config/polybar/config
cp launch.sh $HOME/.config/polybar/launch.sh
cp weather $HOME/.config/polybar/weather
cp config-i3 $HOME/.config/i3/config
echo "==!Done!=="
