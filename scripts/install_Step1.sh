#!/bin/bash
#Warning:挂载好硬盘后食用！
echo "--Install ArchLinux Step.1--"
echo "--Add mirrorlist--"
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo "Server = http://mirrors.aliyun.com/archlinux/$repo/os/arch" > /etc/pacman.d/mirrorlist
echo "done!"
echo "-----------------------------------------------"
echo "--Install base system--"
pacstrap -i /mnt base base-devel
echo "done!"
echo "-----------------------------------------------"
echo "--Generate fstab--"
genfstab -U -p /mnt > /mnt/etc/fstab
echo "done!"
arch-chroot /mnt /bin/bash