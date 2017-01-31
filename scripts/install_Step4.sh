#!/bin/bash
echo "--Install desktop--"
pacman -S xorg-server xorg-server-utils xorg-xinit xorg-xinit xorg-utils xterm \
i3lock i3status i3-wm dmenu feh sakura lightdm fcitx fcitx-im fcitx-configtool \
networkmanager
echo "done!"
echo "--Config desktop--"
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec i3" > ~/.xinitrc
