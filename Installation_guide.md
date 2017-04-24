[TOC]
## 磁盘分区
#### [主引导扇区](https://zh.wikipedia.org/wiki/%E4%B8%BB%E5%BC%95%E5%AF%BC%E8%AE%B0%E5%BD%95)(Master Boot Record,MBR)
磁盘的0柱面(Cylinder),０磁头,1扇区(Sector)叫做主引导扇区.由三部分组成：
* 主引导分区(Master Boot Record,MBR),446bytes
* 分区表(Partition Table,DPT),64bytes
* 硬盘有效标志(Magic Number),2bytes,固定为55AA 

注:硬盘一个扇区大小为512bytes,MBR同时可以指主引导扇区和主引导扇区的前446bytes(即主引导分区)
#### 分区表GUID Partition Table(GPT),Master Boot Record(MBR)
* GPT磁盘分区样式支持最大卷为128EB,MBR只支持2TB
* MBR最多有４个分区,GTP分区数没有上线,只受操作系统限制
* 与MBR分区的磁盘不同,至关重要的平台操作数据位于分区,而不是位于非分区或隐藏扇区.另外,GPT分区磁盘有备份分区表来提高分区数据结构的完整性.

#### 选择哪种分区
* 如果使用GRUB legacy作为bootloader,必须使用MBR.
* 如果使用传统的BIOS,并且双启动中包含Windows(无论是32位版还是64位版),必须使用MBR.
* 如果使用UEFI启动而不是BIOS,并且双启动中包含Windows　64位版,必须使用GPT.
* 非常老的机器需要使用MBR,因为BIOS可能不支持GPT.
* 如果不属于上述任何一种情况,可以随意选择使用GPT还是MBR.由于GPT更先进,建议选择GPT.
* 现在的电脑基本都是UEFI,所以建议选择GPT

#### 分区规划
根据上述选择MBR,GPT分区
MBR分区规划
MBR分区只支持４个分区，有３种分区类型:
* 主分区(Primary)
* 拓展分区(Extended)
* 逻辑分区(Logical)

其中主分区和拓展分区总共只能有４个.如果需要４个以上分区就需要建立包含逻辑分区的拓展分区.建议使用P+P+P+E模式分区,整个磁盘如下:
```
--------------------------------------------------------
| M |  Primary | Primary | Primary |     Extended      |
| B |---------------------------------------------------
| R |  P1      | P2      | P3      | P5 | P6 | P7 | P8 |
--------------------------------------------------------
```
GPT分区规划
GPT中没有主分区限制,可按要求同理创建分区

#### 分区方案
建议分区:对磁盘sda分区(双系统,双硬盘注意!不要分错!)
```
建议给swap分４G,/boot/EFI分512M 
NAME          SIZE     FSTYPE    MOUNTPOIN
sda           120G
├──sda1     vfat     512M      /boot/EFI
├──sda2     ext4     36G       / 
├──sda3     ext4     79.5G     /home
└──sda4     swap     4G        [SWAP]
```
## 开机流程
计算机在开机时会自动加载写在主板中的"软件":[BIOS](https://en.wikipedia.org/wiki/BIOS)/[UEFI](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface_)
