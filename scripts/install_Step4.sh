#!/bin/bash
#图形界面安装
#Warning:确保驱动安装正确
echo "--Install desktop--"
pacman -S xorg-server xorg-server-utils xorg-xinit xorg-xinit xorg-utils xterm \
i3lock i3status i3-wm dmenu feh sakura lightdm fcitx fcitx-im fcitx-configtool \
fcitx-sogoupinyin
echo "done!"
echo "--Config desktop--"
cp /etc/X11/xinit/xinitrc ~/.xinitrc
systemctl enable lightdm.service
echo "exec i3" > ~/.xinitrc
echo "export GTK_IM_MODULE=fcitx" > ~/.xprofile
echo "export QT_IM_MODULE=fcitx" > ~/.xprofile
echo "export XMODIFIERS="@im=fcitx"" > ~/.xprofile