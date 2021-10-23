file_exist(){
	if [ ! -e "/dev/$1" ]; then
		echo "The $val disk partition is no exist!"
		exit
	fi
}

# choose the disk partition

timedatectl set-ntp true
timedatectl status
echo "Please input a main disk partition (example: sda1): "
read main
file_exist $main
echo "Please input a efi disk partition (example: sda1): "
read efi
file_exist $efi
echo "Please input a swap disk partition (example: sda1): "
read swap
file_exist $swap

# start formatting

mkfs.ext4 /dev/$main
mkfs.fat -F32 /dev/$efi
mkswap /dev/$swap
swapon /dev/$swap

# start mounting

mount /dev/$main /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi

# start installing

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# end chroot
umount -R /mnt
reboot