sudo pacman -S reflector
sudo reflector --verbose --country 'China' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu
sudo pacman -S wqy-zenhei noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -S fcitx fcitx-libpinyin fcitx-cloudpinyin fcitx-table-extra fcitx-table-other fcitx-qt5 fcitx-configtool
sudo pacman -S yay
yay -S fcitx-qt4
echo "GTK_IM_MODULE DEFAULT=fcitx\nQT_IM_MODULE DEFAULT=fcitx\nXMODIFIERS DEFAULT=@im=fcitx" > ~/.pam_environment