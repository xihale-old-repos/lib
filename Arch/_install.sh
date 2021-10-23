# start installing

pacman -S vim
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
printf "en_US.UTF-8\nzh_CN.UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Please set a hostname (example:xihale): "
read hostname
echo $hostname > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
passwd
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S networkmanager network-manager-applet wpa_supplicant wireless_tools openssh base-devel linux-headers dialog os-prober mtools dosfstools
curl http://arch.xurl.ga:88/__install.sh > _install.sh
exit