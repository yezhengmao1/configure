#!/bin/bash
#Warning:安装系统后食用! 本地化设置!
echo "--Localization--"
echo "--Config Locale--"
cp /etc/locale.gen /etc/locale.gen.bak
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
systemctl enable dhcpcd
#HOSTNAME自行修改
HOSTNAME='Arch-Ye'
echo ${HOSTNAME} > /etc/hostname
sed -i '/localhost/s/$/\t'"${HOSTNAME}"'/g' /etc/hosts
echo "Done!"
echo "--------------------------------------------"
echo "--Install boot loader--"
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=ArchLinux --recheck
grub-mkconfig -o /boot/grub/grub.cfg
echo "Done!"
echo "Please Umount And Reboot!"
