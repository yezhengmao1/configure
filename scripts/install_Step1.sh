#!/bin/bash
#Warning!!After Mount /mnt /mnt/home /mnt/boot/EFI(UEFI) 
echo "--Install ArchLinux Basic System--"
echo "--Add Mirrorlist--"
Server="Server = http://mirrors.aliyun.com/archlinux/\$repo/os/arch"
File=/etc/pacman.d/mirrorlist
cp ${File} ${File}.bak
echo ${Server} >> ${File} 
echo "--Step.1 Done!--"
echo "--Install Base System--"
pacstrap -i /mnt base base-devel
echo "--Step.2 Done!--"
echo "--Generate fstab--"
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt /bin/base
