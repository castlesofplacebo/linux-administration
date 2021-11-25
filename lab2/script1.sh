#!/bin/bash

#1
lsblk
fdisk /dev/sda/
#in interactive mode: n, p, 3, +300M, w

#2
cd ~
touch new_partition_uuid
blkid /dev/sda3 > new_partition_uuid
cat new_partition_uuid

#3
mke2fs -t ext4 -b 4096 /dev/sda3

#4
dumpe2fs -h /dev/sda3

#5
tune2fs -i 2m -c 2 /dev/sda3

#6
cd ~/mnt
mkdir newdisk
mount /dev/sda3 newdisk/

#7
ln -s /mnt/newdisk newdisk

#8
cd ~
cd newdisk
mkdir new_folder

#9
nano /etc/fstab
/dev/sda3 /mnt/newdisk ext4 noatime,noexec 0 0

#10
umount /dev/sda3
fdisk /dev/sda
#in interactive mode: d, 3, n, p, 3, +350M, N, w
reboot
resize2fs /dev/sda3
lsblk

#11
e2fsck -n /dev/sda3

#12
umount /dev/sda3
fdisk /dev/sda
#in interactive mode: n, p, +12M, w
mke2fs -b 4096 -O journal_dev /dev/sda4
tune2fs -O ^has_journal /dev/sda3
tune2fs -j -J device=/dev/sda4 /dev/sda3
#for checking:
tune2fs -l /dev/sda3
blkid /dev/sda4

#13
#removing journal
umount /dev/sda3
tune2fs -O ^has_journal /dev/sda3
fdisk /dev/sda
#in interactive mode: d, 4, w

fdisk /dev/sda
#in interactive mode: n, e, 4, Y, w
reboot
fdisk /dev/sda
#in interactive mode: n, +100M, n, +100M, w
lsblk

#14
mkdir /mnt/supernewdisk
pvcreate /dev/sda5 /dev/sda6
vgcreate vol_grp1 /dev/sda5 /dev/sda6
lvcreate -l 48 -n logical_vol1 vol_grp1
mke2fs -t ext4 /dev/vol_grp1/logical_vol1
mount /dev/vol_grp1/logical_vol1 /mnt/supernewdisk

#15
mkdir /mnt/share
mount.cifs //192.168.56.1/Users/castl/lab2_folder /mnt/share/ -o user=castlesofplacebo@gmail.com

#16
/root/.smb #user, password
nano /etc/fstab
//192.168.56.1/Users/castl/lab2_folder /mnt/share cifs credentials=/root/.smb 0 0
reboot
df -h
