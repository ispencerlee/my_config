#!/bin/bash

# Change the fontsize
setfont ter-132n

# Enable dhcpcd
dhcpcd 

# connect wifi 
iwctl 
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect OpenWrt

# test connection  
ping baidu.com

# setup time
timedatectl set-ntp true
# check 
timedatectl status

# change mirrolist order
rm /etc/pacman.d/mirrorlist
cp my_config/archInstallScript/mirrolist /etc/pacman.d/mirrorlist

# partiton disk 
fdisk -l 
pacstrap /mnt base base-devel linux linux-firmware

pacstrap /mnt dhcpcd iwd vim bash-comletion 

pacman -S intel-ucode

pacman -S grub efibootmgr

sudo pacman -S networkmanager network-manager-applet xorg sddm xmonad xmonad-contrib xmobar trayer rofi dunst neovim alacritty git openssh lux google-chrome tlp nitrogen feh picom pluseaudio lsa-utils pulseaudio-alsa pavucontrol alsa 

sudo pacman -S xsel python2-pip python-pip ruby yarn nodejs npm 

sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim


