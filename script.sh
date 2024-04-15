#! /bin/bash
sudo mkdir /install
sudo apt update
sudo apt upgrade -y
echo ""
echo ""
echo ""
echo ""
echo "Apt updates done"
echo "(1/5)"
echo ""
echo ""
echo ""
sudo dphys-swapfile swapoff
sudo sed -i -e 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=4096/g'
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
echo ""
echo ""
echo ""
echo ""
echo "Swap Enabled"
echo "(2/5)"
echo ""
echo ""
echo ""
sudo apt install xserver-xorg --no-install-recommends --no-install-suggests -y
sudo apt install xfce4 -y
sudo apt install xfce4-terminal -y
sudo apt install neofetch -y
sudo apt install lightdm --no-install-recommends --no-install-suggests -y
sudo apt install lightdm-gtk-greeter --no-install-recommends --no-install-suggests -y
sudo mv /usr/share/xsessions/openbox.desktop /install/
sudo systemctl enable --now lightdm
echo ""
echo ""
echo ""
echo ""
echo "GUI installed"
echo "(3/5)"
echo ""
echo ""
echo ""
