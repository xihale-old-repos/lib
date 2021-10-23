# start installing
systemctl start NetworkManager
systemctl enable NetworkManager
nmtui
pacman -S mesa vulkan-intel xf86-video-intel
pacman -S xorg
echo "Please set a user (example:xihale): "
read username
useradd -m -G wheel $username
passwd $username
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# install KDE
pacman -S sddm
systemctl enable sddm
pacman -S plasma kde-applications