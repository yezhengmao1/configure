#!/bin/bash
sudo pacman -S zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="af-magic"/g' $HOME/.zshrc
