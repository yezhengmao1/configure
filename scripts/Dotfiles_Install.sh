#!/bin/bash
cd ../dotfiles
mkdir -p $HOME/.vim/colors
cp solarized.vim $HOME/.vim/colors/
#cp config-zsh $HOME/.zshrc
cp config-vim $HOME/.vimrc
cp config-urxvt $HOME/.Xresources
cp config-i3 $HOME/.config/i3/config
cp config-polybar $HOME/.config/polybar/config
cp launch.sh $HOME/.config/polybar/launch.sh
cp weather $HOME/.config/polybar/weather
echo "Dotfiles Install [OK!]"
