#!/bin/bash
#sudo pacman -S zsh
git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="bira"/g' $HOME/.zshrc
chsh -s /bin/zsh
echo "Installed Oh-My-Zsh [OK]"
